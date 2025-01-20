@interface SXDocumentSectionBlueprint
+ (SXDocumentSectionBlueprint)blueprintWithItems:(id)a3;
- (NSArray)items;
@end

@implementation SXDocumentSectionBlueprint

+ (SXDocumentSectionBlueprint)blueprintWithItems:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = v3;

  return (SXDocumentSectionBlueprint *)v4;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end