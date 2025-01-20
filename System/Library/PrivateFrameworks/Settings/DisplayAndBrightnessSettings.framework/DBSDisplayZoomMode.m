@interface DBSDisplayZoomMode
- (CGSize)size;
- (DBSDisplayZoomMode)initWithDisplayZoomOption:(unint64_t)a3 localizedName:(id)a4 size:(CGSize)a5;
- (NSString)localizedName;
- (unint64_t)displayZoomOption;
@end

@implementation DBSDisplayZoomMode

- (DBSDisplayZoomMode)initWithDisplayZoomOption:(unint64_t)a3 localizedName:(id)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DBSDisplayZoomMode;
  v10 = [(DBSDisplayZoomMode *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_displayZoomOption = a3;
    uint64_t v12 = [v9 copy];
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v12;

    v11->_size.CGFloat width = width;
    v11->_size.CGFloat height = height;
  }

  return v11;
}

- (unint64_t)displayZoomOption
{
  return self->_displayZoomOption;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end