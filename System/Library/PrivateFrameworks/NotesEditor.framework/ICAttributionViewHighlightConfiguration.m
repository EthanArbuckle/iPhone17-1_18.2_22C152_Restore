@interface ICAttributionViewHighlightConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICAttributionViewHighlightConfiguration:(id)a3;
- (CGRect)adjustedFrame;
- (CGRect)frame;
- (ICAttributionViewHighlightConfiguration)init;
- (NSString)identifier;
- (UIColor)color;
- (double)alpha;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAdjustedFrame:(CGRect)a3;
- (void)setAlpha:(double)a3;
- (void)setColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation ICAttributionViewHighlightConfiguration

- (ICAttributionViewHighlightConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICAttributionViewHighlightConfiguration;
  result = [(ICAttributionViewHighlightConfiguration *)&v3 init];
  if (result) {
    result->_alpha = 1.0;
  }
  return result;
}

- (BOOL)isEqualToICAttributionViewHighlightConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(ICAttributionViewHighlightConfiguration *)self identifier];
  v6 = [v4 identifier];
  if (![v5 isEqualToString:v6]) {
    goto LABEL_4;
  }
  [(ICAttributionViewHighlightConfiguration *)self frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v4 frame];
  v24.origin.x = v15;
  v24.origin.y = v16;
  v24.size.width = v17;
  v24.size.height = v18;
  v23.origin.x = v8;
  v23.origin.y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  if (CGRectEqualToRect(v23, v24))
  {
    v19 = [(ICAttributionViewHighlightConfiguration *)self color];
    v20 = [v4 color];
    char v21 = [v19 isEqual:v20];
  }
  else
  {
LABEL_4:
    char v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICAttributionViewHighlightConfiguration *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICAttributionViewHighlightConfiguration *)self isEqualToICAttributionViewHighlightConfiguration:v5];

  return v6;
}

- (unint64_t)hash
{
  objc_super v3 = [(ICAttributionViewHighlightConfiguration *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(ICAttributionViewHighlightConfiguration *)self color];
  char v6 = [v5 hash];
  unint64_t v14 = ICHashWithHashKeys(v4, v7, v8, v9, v10, v11, v12, v13, v6);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[ICAttributionViewHighlightConfiguration allocWithZone:a3] init];
  v5 = [(ICAttributionViewHighlightConfiguration *)self identifier];
  [(ICAttributionViewHighlightConfiguration *)v4 setIdentifier:v5];

  [(ICAttributionViewHighlightConfiguration *)self frame];
  -[ICAttributionViewHighlightConfiguration setFrame:](v4, "setFrame:");
  [(ICAttributionViewHighlightConfiguration *)self frame];
  -[ICAttributionViewHighlightConfiguration setAdjustedFrame:](v4, "setAdjustedFrame:");
  [(ICAttributionViewHighlightConfiguration *)self alpha];
  -[ICAttributionViewHighlightConfiguration setAlpha:](v4, "setAlpha:");
  char v6 = [(ICAttributionViewHighlightConfiguration *)self color];
  [(ICAttributionViewHighlightConfiguration *)v4 setColor:v6];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGRect)frame
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

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)adjustedFrame
{
  double x = self->_adjustedFrame.origin.x;
  double y = self->_adjustedFrame.origin.y;
  double width = self->_adjustedFrame.size.width;
  double height = self->_adjustedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAdjustedFrame:(CGRect)a3
{
  self->_adjustedFrame = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end