@interface CRLShapeLibraryCategory
- (NSArray)shapeIDs;
- (NSString)categoryID;
- (NSString)localizationKey;
- (NSString)name;
@end

@implementation CRLShapeLibraryCategory

- (NSString)categoryID
{
  return (NSString *)[(CRLShapeLibraryObject *)self objectForKey:@"id"];
}

- (NSString)localizationKey
{
  return (NSString *)[(CRLShapeLibraryObject *)self objectForKey:@"localizationKey"];
}

- (NSString)name
{
  v2 = [(CRLShapeLibraryCategory *)self localizationKey];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:v2 value:0 table:@"CRLShapeLibrarianCategoryNames"];

  return (NSString *)v4;
}

- (NSArray)shapeIDs
{
  return (NSArray *)[(CRLShapeLibraryObject *)self objectForKey:@"shapeIDs"];
}

@end