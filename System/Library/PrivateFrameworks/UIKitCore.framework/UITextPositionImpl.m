@interface UITextPositionImpl
+ (id)wrapWebVisiblePosition:(id)a3;
- (BOOL)isEqual:(id)a3;
- (WebVisiblePosition)webVisiblePosition;
- (id)description;
- (void)setWebVisiblePosition:(id)a3;
@end

@implementation UITextPositionImpl

+ (id)wrapWebVisiblePosition:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(UITextPositionImpl);
  [(UITextPositionImpl *)v4 setWebVisiblePosition:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(UITextPositionImpl *)self webVisiblePosition];
  v6 = [v4 webVisiblePosition];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)description
{
  id v3 = [(UITextPositionImpl *)self webVisiblePosition];
  id v4 = [v3 positionOfNextBoundaryOfGranularity:5 inDirection:1];

  v5 = [(UITextPositionImpl *)self webVisiblePosition];
  v6 = [v5 positionOfNextBoundaryOfGranularity:5 inDirection:0];

  v7 = [(UITextPositionImpl *)self webVisiblePosition];
  id v8 = [v7 positionByMovingInDirection:1 amount:10];

  if (!v8) {
    id v8 = v4;
  }
  v9 = NSString;
  if ([v4 compare:v8]) {
    v10 = @"...";
  }
  else {
    v10 = &stru_1ED0E84C0;
  }
  v11 = (void *)MEMORY[0x1E4FB6D78];
  v12 = [(UITextPositionImpl *)self webVisiblePosition];
  v13 = [v11 rangeForFirstPosition:v8 second:v12];
  v14 = [v13 text];
  v29 = [v9 stringWithFormat:@"%@%@", v10, v14];

  v15 = [(UITextPositionImpl *)self webVisiblePosition];
  id v16 = [v15 positionByMovingInDirection:0 amount:10];

  if (!v16) {
    id v16 = v6;
  }
  v17 = NSString;
  v18 = (void *)MEMORY[0x1E4FB6D78];
  v19 = [(UITextPositionImpl *)self webVisiblePosition];
  v20 = [v18 rangeForFirstPosition:v19 second:v16];
  v21 = [v20 text];
  uint64_t v22 = [v6 compare:v16];
  v23 = @"...";
  if (!v22) {
    v23 = &stru_1ED0E84C0;
  }
  v24 = [v17 stringWithFormat:@"%@%@", v21, v23];

  v25 = NSString;
  v26 = [(UITextPositionImpl *)self webVisiblePosition];
  v27 = [v25 stringWithFormat:@"<UITextPosition: %p, %i, {\"%@\"}, {\"%@\"}>", self, objc_msgSend(v26, "distanceFromPosition:", v4), v29, v24];

  return v27;
}

- (WebVisiblePosition)webVisiblePosition
{
  return self->_webVisiblePosition;
}

- (void)setWebVisiblePosition:(id)a3
{
}

- (void).cxx_destruct
{
}

@end