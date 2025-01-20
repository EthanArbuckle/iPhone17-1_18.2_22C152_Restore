@interface _UILargeContentViewerItemStoredProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)didSetLargeContentImage;
- (BOOL)didSetLargeContentImageInsets;
- (BOOL)didSetLargeContentTitle;
- (BOOL)didSetScalesLargeContentImage;
- (BOOL)didSetShowsLargeContentViewer;
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (NSString)largeContentTitle;
- (UIEdgeInsets)largeContentImageInsets;
- (UIImage)largeContentImage;
- (_UILargeContentViewerItemStoredProperties)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDidSetLargeContentImage:(BOOL)a3;
- (void)setDidSetLargeContentImageInsets:(BOOL)a3;
- (void)setDidSetLargeContentTitle:(BOOL)a3;
- (void)setDidSetScalesLargeContentImage:(BOOL)a3;
- (void)setDidSetShowsLargeContentViewer:(BOOL)a3;
- (void)setLargeContentImage:(id)a3;
- (void)setLargeContentImageInsets:(UIEdgeInsets)a3;
- (void)setLargeContentTitle:(id)a3;
- (void)setScalesLargeContentImage:(BOOL)a3;
- (void)setShowsLargeContentViewer:(BOOL)a3;
@end

@implementation _UILargeContentViewerItemStoredProperties

- (void)setLargeContentImage:(id)a3
{
  v4 = (UIImage *)a3;
  [(_UILargeContentViewerItemStoredProperties *)self setDidSetLargeContentImage:1];
  largeContentImage = self->_largeContentImage;
  self->_largeContentImage = v4;
}

- (void)setDidSetLargeContentImage:(BOOL)a3
{
  self->_didSetLargeContentImage = a3;
}

- (void)setShowsLargeContentViewer:(BOOL)a3
{
  self->_showsLargeContentViewer = a3;
}

- (void)setDidSetShowsLargeContentViewer:(BOOL)a3
{
  self->_didSetShowsLargeContentViewer = a3;
}

- (void)setLargeContentTitle:(id)a3
{
  id v4 = a3;
  [(_UILargeContentViewerItemStoredProperties *)self setDidSetLargeContentTitle:1];
  v5 = (NSString *)[v4 copy];

  largeContentTitle = self->_largeContentTitle;
  self->_largeContentTitle = v5;
}

- (void)setDidSetLargeContentTitle:(BOOL)a3
{
  self->_didSetLargeContentTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeContentImage, 0);
  objc_storeStrong((id *)&self->_largeContentTitle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UILargeContentViewerItemStoredProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UILargeContentViewerItemStoredProperties;
  v5 = [(_UILargeContentViewerItemStoredProperties *)&v17 init];
  if (v5)
  {
    v5->_didSetShowsLargeContentViewer = [v4 decodeBoolForKey:@"DidSetShowsLargeContentViewer"];
    v5->_showsLargeContentViewer = [v4 decodeBoolForKey:@"ShowsLargeContentViewer"];
    v5->_didSetLargeContentTitle = [v4 decodeBoolForKey:@"DidSetLargeContentTitle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LargeContentTitle"];
    largeContentTitle = v5->_largeContentTitle;
    v5->_largeContentTitle = (NSString *)v6;

    v5->_didSetLargeContentImage = [v4 decodeBoolForKey:@"DidSetLargeContentImage"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LargeContentImage"];
    largeContentImage = v5->_largeContentImage;
    v5->_largeContentImage = (UIImage *)v8;

    v5->_didSetScalesLargeContentImage = [v4 decodeBoolForKey:@"DidSetScalesLargeContentImage"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScalesLargeContentImage"];
    v5->_scalesLargeContentImage = v10 != 0;

    v5->_didSetLargeContentImageInsets = [v4 decodeBoolForKey:@"DidSetLargeContentImageInsets"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LargeContentImageInsets"];
    [v11 UIEdgeInsetsValue];
    v5->_largeContentImageInsets.top = v12;
    v5->_largeContentImageInsets.left = v13;
    v5->_largeContentImageInsets.bottom = v14;
    v5->_largeContentImageInsets.right = v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetShowsLargeContentViewer](self, "didSetShowsLargeContentViewer"), @"DidSetShowsLargeContentViewer");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties showsLargeContentViewer](self, "showsLargeContentViewer"), @"ShowsLargeContentViewer");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetLargeContentTitle](self, "didSetLargeContentTitle"), @"DidSetLargeContentTitle");
  v5 = [(_UILargeContentViewerItemStoredProperties *)self largeContentTitle];
  [v4 encodeObject:v5 forKey:@"LargeContentTitle"];

  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetLargeContentImage](self, "didSetLargeContentImage"), @"DidSetLargeContentImage");
  uint64_t v6 = [(_UILargeContentViewerItemStoredProperties *)self largeContentImage];
  [v4 encodeObject:v6 forKey:@"LargeContentImage"];

  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetScalesLargeContentImage](self, "didSetScalesLargeContentImage"), @"DidSetScalesLargeContentImage");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties scalesLargeContentImage](self, "scalesLargeContentImage"), @"ScalesLargeContentImage");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UILargeContentViewerItemStoredProperties didSetLargeContentImageInsets](self, "didSetLargeContentImageInsets"), @"DidSetLargeContentImageInsets");
  v7 = (void *)MEMORY[0x1E4F29238];
  [(_UILargeContentViewerItemStoredProperties *)self largeContentImageInsets];
  objc_msgSend(v7, "valueWithUIEdgeInsets:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"LargeContentImageInsets"];
}

- (void)setScalesLargeContentImage:(BOOL)a3
{
  self->_scalesLargeContentImage = a3;
}

- (void)setLargeContentImageInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  [(_UILargeContentViewerItemStoredProperties *)self setDidSetLargeContentImageInsets:1];
  self->_largeContentImageInsets.CGFloat top = top;
  self->_largeContentImageInsets.CGFloat left = left;
  self->_largeContentImageInsets.CGFloat bottom = bottom;
  self->_largeContentImageInsets.CGFloat right = right;
}

- (BOOL)didSetShowsLargeContentViewer
{
  return self->_didSetShowsLargeContentViewer;
}

- (BOOL)showsLargeContentViewer
{
  return self->_showsLargeContentViewer;
}

- (BOOL)didSetLargeContentTitle
{
  return self->_didSetLargeContentTitle;
}

- (NSString)largeContentTitle
{
  return self->_largeContentTitle;
}

- (BOOL)didSetLargeContentImage
{
  return self->_didSetLargeContentImage;
}

- (UIImage)largeContentImage
{
  return self->_largeContentImage;
}

- (BOOL)didSetScalesLargeContentImage
{
  return self->_didSetScalesLargeContentImage;
}

- (void)setDidSetScalesLargeContentImage:(BOOL)a3
{
  self->_didSetScalesLargeContentImage = a3;
}

- (BOOL)scalesLargeContentImage
{
  return self->_scalesLargeContentImage;
}

- (BOOL)didSetLargeContentImageInsets
{
  return self->_didSetLargeContentImageInsets;
}

- (void)setDidSetLargeContentImageInsets:(BOOL)a3
{
  self->_didSetLargeContentImageInsets = a3;
}

- (UIEdgeInsets)largeContentImageInsets
{
  double top = self->_largeContentImageInsets.top;
  double left = self->_largeContentImageInsets.left;
  double bottom = self->_largeContentImageInsets.bottom;
  double right = self->_largeContentImageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end