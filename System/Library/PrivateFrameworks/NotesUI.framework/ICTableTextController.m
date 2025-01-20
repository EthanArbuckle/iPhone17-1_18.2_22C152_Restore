@interface ICTableTextController
- (ICTableTextController)init;
- (id)defaultTypingAttributesForEmptyDocument;
- (void)styleText:(id)a3 inRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5;
@end

@implementation ICTableTextController

- (ICTableTextController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICTableTextController;
  v2 = [(ICTextController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ICTextController *)v2 setIsAutoListInsertionDisabled:1];
  }
  return v3;
}

- (void)styleText:(id)a3 inRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  if (length) {
    goto LABEL_5;
  }
  if (location != [v9 length]) {
    goto LABEL_5;
  }
  objc_opt_class();
  v10 = ICCheckedDynamicCast();
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  id v11 = (id)[v10 rowAtIndex:location rowRange:&v14];
  uint64_t v12 = v15;

  if (v12)
  {
LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)ICTableTextController;
    -[ICTTTextController styleText:inRange:fixModelAttributes:](&v13, sel_styleText_inRange_fixModelAttributes_, v9, location, length, v5);
  }
}

- (id)defaultTypingAttributesForEmptyDocument
{
  v3 = [(ICTTTextController *)self bodyAttributes];
  v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [MEMORY[0x1E4F834E8] paragraphStyleNamed:3];
  [v4 setObject:v5 forKey:*MEMORY[0x1E4F83220]];
  v6 = [(ICTTTextController *)self zoomController];
  v7 = [v6 zoomFontInAttributes:v4];

  v8 = (void *)[v7 copy];
  return v8;
}

@end