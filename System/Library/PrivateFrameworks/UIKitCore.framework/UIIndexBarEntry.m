@interface UIIndexBarEntry
+ (UIIndexBarEntry)entryWithTitle:(id)a3;
+ (UIIndexBarEntry)entryWithType:(int64_t)a3;
+ (id)_dotImageInView:(id)a3;
+ (id)_externalDotImageInView:(id)a3;
+ (id)entryForDotInView:(id)a3;
+ (id)entryForNumbers;
+ (id)entryForSearch;
- (BOOL)hasPoundTitle;
- (NSIndexPath)indexPath;
- (NSString)effectiveShortTitle;
- (NSString)shortTitle;
- (NSString)title;
- (UIImage)image;
- (id)description;
- (int64_t)type;
- (void)setImage:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setShortTitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation UIIndexBarEntry

- (void)setIndexPath:(id)a3
{
}

+ (UIIndexBarEntry)entryWithTitle:(id)a3
{
  id v4 = a3;
  v5 = [a1 entryWithType:0];
  [v5 setTitle:v4];

  return (UIIndexBarEntry *)v5;
}

- (void)setTitle:(id)a3
{
}

+ (UIIndexBarEntry)entryWithType:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setType:a3];
  return (UIIndexBarEntry *)v4;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

+ (id)entryForNumbers
{
  v2 = [a1 entryWithType:2];
  v3 = _UIImageWithName(@"UISectionListPoundSign");
  [v2 setImage:v3];

  return v2;
}

+ (id)entryForSearch
{
  v2 = [a1 entryWithType:3];
  v3 = _UIImageWithName(@"UITableViewIndexSearchGlyph");
  [v2 setImage:v3];

  return v2;
}

+ (id)entryForDotInView:(id)a3
{
  id v4 = a3;
  v5 = [a1 entryWithType:1];
  v6 = [a1 _dotImageInView:v4];

  [v5 setImage:v6];
  return v5;
}

+ (id)_dotImageInView:(id)a3
{
  id v4 = a3;
  v5 = [v4 traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 3) {
    [a1 _externalDotImageInView:v4];
  }
  else {
  v7 = _UIImageWithName(@"UITableViewIndexDot");
  }

  return v7;
}

+ (id)_externalDotImageInView:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__UIIndexBarEntry__externalDotImageInView___block_invoke;
  block[3] = &unk_1E52D9F70;
  id v9 = v3;
  uint64_t v4 = _MergedGlobals_1319;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_MergedGlobals_1319, block);
  }
  id v6 = (id)qword_1EB264F78;

  return v6;
}

void __43__UIIndexBarEntry__externalDotImageInView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _currentScreenScale];
  _UIGraphicsBeginImageContextWithOptions(0, 0, 4.0, 4.0, v1);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    id v3 = 0;
  }
  else {
    id v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 4.0;
  v7.size.height = 4.0;
  CGContextFillEllipseInRect(v3, v7);
  uint64_t v4 = _UIGraphicsGetImageFromCurrentImageContext(0);
  id v5 = (void *)qword_1EB264F78;
  qword_1EB264F78 = v4;

  UIGraphicsEndImageContext();
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@"; title='%@'", self->_title];
  [v3 appendFormat:@"; shortTitle='%@'", self->_shortTitle];
  [v3 appendString:@">"];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)effectiveShortTitle
{
  id v3 = [(UIIndexBarEntry *)self shortTitle];

  if (v3) {
    [(UIIndexBarEntry *)self shortTitle];
  }
  else {
  uint64_t v4 = [(UIIndexBarEntry *)self title];
  }
  return (NSString *)v4;
}

- (BOOL)hasPoundTitle
{
  v2 = [(UIIndexBarEntry *)self title];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isEqualToString:@"#"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSString)shortTitle
{
  return self->_shortTitle;
}

- (void)setShortTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end