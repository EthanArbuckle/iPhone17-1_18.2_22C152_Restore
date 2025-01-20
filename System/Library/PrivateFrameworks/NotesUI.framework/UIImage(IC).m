@interface UIImage(IC)
+ (id)ic_applicationIconImageWithSize:()IC;
+ (id)ic_hierarchicalNonSystemImageNamed:()IC colors:fontTextStyle:scale:maxContentSizeCategory:;
+ (id)ic_hierarchicalSystemImageNamed:()IC colors:fontTextStyle:scale:maxContentSizeCategory:;
+ (id)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:;
+ (id)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:fontTextStyle:;
+ (id)ic_makeCircularImageWithColor:()IC diameter:borderColor:borderWidth:;
+ (id)ic_scaledHierarchicalSystemImageNamed:()IC scale:colors:;
+ (id)ic_systemImageNamed:()IC fromFont:;
+ (id)ic_systemImageNamed:()IC fromFont:scale:;
+ (id)ic_systemImageNamed:()IC pointSize:weight:;
+ (id)ic_systemImageNamed:()IC scale:;
+ (id)ic_systemImageNamed:()IC textStyle:;
+ (id)ic_systemImageNamed:()IC textStyle:scale:;
+ (id)ic_systemImageNamed:()IC textStyle:scale:maxContentSizeCategory:;
+ (id)symbolImageConfigurationWithTextStyle:()IC scale:maxContentSizeCategory:;
+ (uint64_t)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:fontTextStyle:maxContentSizeCategory:;
+ (uint64_t)ic_largeSystemImageNamed:()IC;
+ (uint64_t)ic_makeCircularImageWithColor:()IC diameter:;
+ (uint64_t)ic_smallSystemImageNamed:()IC;
+ (uint64_t)ic_systemImageNamed:()IC pointSize:;
- (id)ic_imageWithFont:()IC;
- (id)ic_imageWithFont:()IC cappedToSize:;
- (id)ic_imageWithFont:()IC scale:;
- (id)ic_imageWithScale:()IC;
- (id)ic_imageWithTextStyle:()IC;
- (id)ic_imageWithTextStyle:()IC scale:;
@end

@implementation UIImage(IC)

+ (uint64_t)ic_systemImageNamed:()IC pointSize:
{
  return objc_msgSend(a1, "ic_systemImageNamed:pointSize:weight:", a3, 4);
}

+ (uint64_t)ic_largeSystemImageNamed:()IC
{
  return objc_msgSend(a1, "ic_systemImageNamed:scale:", a3, 3);
}

+ (id)ic_systemImageNamed:()IC scale:
{
  v6 = (void *)MEMORY[0x1E4FB1830];
  id v7 = a3;
  v8 = [v6 configurationWithScale:a4];
  v9 = [a1 systemImageNamed:v7 withConfiguration:v8];

  return v9;
}

+ (id)ic_systemImageNamed:()IC pointSize:weight:
{
  id v7 = (void *)MEMORY[0x1E4FB1830];
  id v8 = a4;
  v9 = [v7 configurationWithPointSize:a5 weight:a1];
  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v8 withConfiguration:v9];

  return v10;
}

+ (id)ic_applicationIconImageWithSize:()IC
{
  v4 = [MEMORY[0x1E4F6F248] applicationIcon];
  objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
  double v6 = v5;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", a1, a2, v5);
  id v8 = (id)[v4 prepareImageForDescriptor:v7];
  v9 = [v4 imageForDescriptor:v7];
  v10 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", objc_msgSend(v9, "CGImage"), 0, v6);

  return v10;
}

+ (uint64_t)ic_smallSystemImageNamed:()IC
{
  return objc_msgSend(a1, "ic_systemImageNamed:scale:", a3, 1);
}

+ (id)ic_systemImageNamed:()IC textStyle:
{
  double v6 = (void *)MEMORY[0x1E4FB1830];
  id v7 = a3;
  id v8 = [v6 configurationWithTextStyle:a4];
  v9 = [a1 systemImageNamed:v7 withConfiguration:v8];

  return v9;
}

+ (id)ic_systemImageNamed:()IC textStyle:scale:
{
  id v8 = (void *)MEMORY[0x1E4FB1830];
  id v9 = a3;
  v10 = [v8 configurationWithTextStyle:a4 scale:a5];
  v11 = [a1 systemImageNamed:v9 withConfiguration:v10];

  return v11;
}

+ (id)ic_systemImageNamed:()IC textStyle:scale:maxContentSizeCategory:
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [(id)objc_opt_class() symbolImageConfigurationWithTextStyle:v11 scale:a5 maxContentSizeCategory:v10];

  v14 = [a1 systemImageNamed:v12 withConfiguration:v13];

  return v14;
}

+ (id)ic_systemImageNamed:()IC fromFont:
{
  double v6 = (void *)MEMORY[0x1E4FB1830];
  id v7 = a3;
  id v8 = [v6 configurationWithFont:a4];
  id v9 = [a1 systemImageNamed:v7 withConfiguration:v8];

  return v9;
}

+ (id)ic_systemImageNamed:()IC fromFont:scale:
{
  id v8 = (void *)MEMORY[0x1E4FB1830];
  id v9 = a3;
  id v10 = [v8 configurationWithFont:a4 scale:a5];
  id v11 = [a1 systemImageNamed:v9 withConfiguration:v10];

  return v11;
}

+ (id)ic_scaledHierarchicalSystemImageNamed:()IC scale:colors:
{
  id v7 = (void *)MEMORY[0x1E4FB1830];
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 configurationWithScale:a4];
  id v11 = [MEMORY[0x1E4FB1830] _configurationWithHierarchicalColors:v8];

  id v12 = [v10 configurationByApplyingConfiguration:v11];
  v13 = [MEMORY[0x1E4FB1818] systemImageNamed:v9 withConfiguration:v12];

  return v13;
}

+ (id)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:
{
  double v5 = (void *)MEMORY[0x1E4FB1830];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 configurationWithScale:3];
  id v9 = [MEMORY[0x1E4FB1830] _configurationWithHierarchicalColors:v6];

  id v10 = [v8 configurationByApplyingConfiguration:v9];
  id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v7 withConfiguration:v10];

  return v11;
}

+ (id)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:fontTextStyle:
{
  id v7 = (void *)MEMORY[0x1E4FB08E0];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 preferredFontForTextStyle:a5];
  id v11 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  id v12 = [MEMORY[0x1E4FB1830] _configurationWithHierarchicalColors:v8];

  v13 = [v11 configurationByApplyingConfiguration:v12];
  v14 = [MEMORY[0x1E4FB1830] configurationWithFont:v10];
  v15 = [v13 configurationByApplyingConfiguration:v14];
  v16 = [MEMORY[0x1E4FB1818] systemImageNamed:v9 withConfiguration:v15];

  return v16;
}

+ (uint64_t)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:fontTextStyle:maxContentSizeCategory:
{
  return objc_msgSend(a1, "ic_hierarchicalSystemImageNamed:colors:fontTextStyle:scale:maxContentSizeCategory:", a3, a4, a5, 3, a6);
}

+ (id)ic_hierarchicalSystemImageNamed:()IC colors:fontTextStyle:scale:maxContentSizeCategory:
{
  id v11 = (void *)MEMORY[0x1E4FB1830];
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  v15 = [v11 _configurationWithHierarchicalColors:a4];
  v16 = [(id)objc_opt_class() symbolImageConfigurationWithTextStyle:v13 scale:a6 maxContentSizeCategory:v12];

  v17 = [v15 configurationByApplyingConfiguration:v16];
  v18 = [MEMORY[0x1E4FB1818] systemImageNamed:v14 withConfiguration:v17];

  return v18;
}

+ (id)ic_hierarchicalNonSystemImageNamed:()IC colors:fontTextStyle:scale:maxContentSizeCategory:
{
  id v11 = (void *)MEMORY[0x1E4FB1830];
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  v15 = [v11 _configurationWithHierarchicalColors:a4];
  v16 = [(id)objc_opt_class() symbolImageConfigurationWithTextStyle:v13 scale:a6 maxContentSizeCategory:v12];

  v17 = [v15 configurationByApplyingConfiguration:v16];
  v18 = (void *)MEMORY[0x1E4FB1818];
  v19 = [MEMORY[0x1E4F28B50] mainBundle];
  v20 = [v18 imageNamed:v14 inBundle:v19 withConfiguration:v17];

  return v20;
}

+ (uint64_t)ic_makeCircularImageWithColor:()IC diameter:
{
  return objc_msgSend(a1, "ic_makeCircularImageWithColor:diameter:borderColor:borderWidth:", a3, 0, a4, 0.0);
}

+ (id)ic_makeCircularImageWithColor:()IC diameter:borderColor:borderWidth:
{
  id v9 = a6;
  id v10 = a5;
  double y = 0.0;
  v20.double width = a1;
  v20.double height = a1;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  if (v9 && a2 > 0.0)
  {
    v21.origin.double x = 0.0;
    v21.origin.double y = 0.0;
    v21.size.double width = a1;
    v21.size.double height = a1;
    CGRect v22 = CGRectInset(v21, a2, a2);
    double x = v22.origin.x;
    double y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
    v15 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, a1, a1);
    [v9 setFill];
    [v15 fill];

    a1 = height;
  }
  else
  {
    double width = a1;
    double x = 0.0;
  }
  v16 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", x, y, width, a1);
  [v10 setFill];

  [v16 fill];
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

- (id)ic_imageWithFont:()IC
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithFont:");
  v3 = [a1 imageWithConfiguration:v2];

  return v3;
}

- (id)ic_imageWithFont:()IC cappedToSize:
{
  id v6 = a4;
  [v6 pointSize];
  if (v7 > a2)
  {
    uint64_t v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a2];

    id v6 = (id)v8;
  }
  id v9 = [MEMORY[0x1E4FB1830] configurationWithFont:v6];
  id v10 = [a1 imageWithConfiguration:v9];

  return v10;
}

- (id)ic_imageWithScale:()IC
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithScale:");
  v3 = [a1 imageWithConfiguration:v2];

  return v3;
}

- (id)ic_imageWithFont:()IC scale:
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithFont:scale:");
  v3 = [a1 imageWithConfiguration:v2];

  return v3;
}

- (id)ic_imageWithTextStyle:()IC
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithTextStyle:");
  v3 = [a1 imageWithConfiguration:v2];

  return v3;
}

- (id)ic_imageWithTextStyle:()IC scale:
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithTextStyle:scale:");
  v3 = [a1 imageWithConfiguration:v2];

  return v3;
}

+ (id)symbolImageConfigurationWithTextStyle:()IC scale:maxContentSizeCategory:
{
  double v7 = (void *)MEMORY[0x1E4FB08E0];
  id v8 = a3;
  id v9 = objc_msgSend(v7, "ic_preferredFontForTextStyle:maxContentSizeCategory:", v8, a5);
  id v10 = (void *)MEMORY[0x1E4FB1830];
  [v9 pointSize];
  id v11 = objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 4, a4);
  id v12 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v8];

  id v13 = [v12 configurationByApplyingConfiguration:v11];

  return v13;
}

@end