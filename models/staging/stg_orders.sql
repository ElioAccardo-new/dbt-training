SELECT 
-- from raw orders
       o.orderid,
       o.orderdate,
       o.shipdate,
       o.shipmode,
       o.ordersellingprice - o.ordercostprice as orderprofit,
       o.ordercostprice,
       o.ordersellingprice,
-- from raw customer
       c.customerid,
       c.customername,
       c.segment,
       c.country,
-- from raw_product
       p.category,
       p.productid,
       p.productname,
       p.subcategory,
-- from macro
      {{ markup() }} AS markup
from {{ ref('raw_orders') }} o
left join {{ ref('raw_customer') }} c 
    on o.customerid=c.customerid
left join {{ ref('raw_product') }} p
    on o.productid=p.productid