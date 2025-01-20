@interface CACSystemAperatureBorderItem
+ (id)borderItemsForRect:(CGRect)a3 minimumRect:(CGRect)a4;
- (BOOL)isSpacer;
- (CGRect)elementFrame;
- (CGSize)elementLabelContainerSize;
- (NSString)elementName;
@end

@implementation CACSystemAperatureBorderItem

+ (id)borderItemsForRect:(CGRect)a3 minimumRect:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v40[9] = *MEMORY[0x263EF8340];
  CGRect v42 = CGRectInset(a3, 10.0, 10.0);
  CGFloat v38 = v42.origin.x;
  CGFloat v8 = v42.origin.y;
  CGFloat v9 = v42.size.width;
  CGFloat v10 = v42.size.height;
  v11 = objc_alloc_init(CACSystemAperatureBorderItem);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v44);
  v11->_frame.origin.CGFloat x = MinX;
  v11->_frame.origin.CGFloat y = MinY;
  v11->_frame.size.CGFloat width = width;
  v11->_frame.size.CGFloat height = 1.0;
  v14 = objc_alloc_init(CACSystemAperatureBorderItem);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMinX(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v46);
  v14->_frame.origin.CGFloat x = v15;
  v14->_frame.origin.CGFloat y = MaxY;
  v14->_frame.size.CGFloat width = width;
  v14->_frame.size.CGFloat height = 1.0;
  v17 = objc_alloc_init(CACSystemAperatureBorderItem);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGFloat v18 = CGRectGetMinX(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  CGFloat v19 = CGRectGetMinY(v48);
  v17->_frame.origin.CGFloat x = v18;
  v17->_frame.origin.CGFloat y = v19;
  v17->_frame.size.CGFloat width = 1.0;
  v17->_frame.size.CGFloat height = height;
  v20 = objc_alloc_init(CACSystemAperatureBorderItem);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  CGFloat v22 = CGRectGetMinY(v50);
  v20->_frame.origin.CGFloat x = MaxX;
  v20->_frame.origin.CGFloat y = v22;
  v20->_frame.size.CGFloat width = 1.0;
  v20->_frame.size.CGFloat height = height;
  v23 = objc_alloc_init(CACSystemAperatureBorderItem);
  v51.origin.CGFloat x = v38;
  v51.origin.CGFloat y = v8;
  v51.size.CGFloat width = v9;
  v51.size.CGFloat height = v10;
  CGFloat v24 = CGRectGetMinX(v51);
  v52.origin.CGFloat x = v38;
  v52.origin.CGFloat y = v8;
  v52.size.CGFloat width = v9;
  v52.size.CGFloat height = v10;
  CGFloat v25 = CGRectGetMinY(v52);
  v23->_frame.origin.CGFloat x = v24;
  v23->_frame.origin.CGFloat y = v25;
  v23->_frame.size.CGFloat width = v9;
  v23->_frame.size.CGFloat height = 1.0;
  v26 = objc_alloc_init(CACSystemAperatureBorderItem);
  v53.origin.CGFloat x = v38;
  v53.origin.CGFloat y = v8;
  v53.size.CGFloat width = v9;
  v53.size.CGFloat height = v10;
  CGFloat v27 = CGRectGetMinX(v53);
  v54.origin.CGFloat x = v38;
  v54.origin.CGFloat y = v8;
  v54.size.CGFloat width = v9;
  v54.size.CGFloat height = v10;
  CGFloat v28 = CGRectGetMaxY(v54);
  v26->_frame.origin.CGFloat x = v27;
  v26->_frame.origin.CGFloat y = v28;
  v26->_frame.size.CGFloat width = v9;
  v26->_frame.size.CGFloat height = 1.0;
  v29 = objc_alloc_init(CACSystemAperatureBorderItem);
  v55.origin.CGFloat x = v38;
  v55.origin.CGFloat y = v8;
  v55.size.CGFloat width = v9;
  v55.size.CGFloat height = v10;
  CGFloat v30 = CGRectGetMinX(v55);
  v56.origin.CGFloat x = v38;
  v56.origin.CGFloat y = v8;
  v56.size.CGFloat width = v9;
  v56.size.CGFloat height = v10;
  CGFloat v31 = CGRectGetMinY(v56);
  v29->_frame.origin.CGFloat x = v30;
  v29->_frame.origin.CGFloat y = v31;
  v29->_frame.size.CGFloat width = 1.0;
  v29->_frame.size.CGFloat height = v10;
  v32 = objc_alloc_init(CACSystemAperatureBorderItem);
  v57.origin.CGFloat x = v38;
  v57.origin.CGFloat y = v8;
  v57.size.CGFloat width = v9;
  v57.size.CGFloat height = v10;
  CGFloat v33 = CGRectGetMaxX(v57);
  v58.origin.CGFloat x = v38;
  v58.origin.CGFloat y = v8;
  v58.size.CGFloat width = v9;
  v58.size.CGFloat height = v10;
  CGFloat v34 = CGRectGetMinY(v58);
  v32->_frame.origin.CGFloat x = v33;
  v32->_frame.origin.CGFloat y = v34;
  v32->_frame.size.CGFloat width = 1.0;
  v32->_frame.size.CGFloat height = v10;
  v35 = objc_alloc_init(CACSystemAperatureBorderItem);
  v35->_frame = CGRectInset(a4, 2.0, 2.0);
  v40[0] = v11;
  v40[1] = v14;
  v40[2] = v17;
  v40[3] = v20;
  v40[4] = v23;
  v40[5] = v26;
  v40[6] = v29;
  v40[7] = v32;
  v40[8] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:9];

  return v36;
}

- (NSString)elementName
{
  return (NSString *)@"____";
}

- (CGRect)elementFrame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)elementLabelContainerSize
{
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isSpacer
{
  return 1;
}

@end