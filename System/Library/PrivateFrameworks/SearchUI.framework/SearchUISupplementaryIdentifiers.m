@interface SearchUISupplementaryIdentifiers
+ (NSString)itemSeparatorKind;
+ (NSString)sectionBottomSeparatorKind;
+ (NSString)sectionHeaderKind;
+ (NSString)sectionTopSeparatorKind;
- (SearchUISupplementaryIdentifiers)init;
@end

@implementation SearchUISupplementaryIdentifiers

+ (NSString)sectionHeaderKind
{
  v2 = (void *)sub_1E46A6040();
  return (NSString *)v2;
}

+ (NSString)sectionTopSeparatorKind
{
  v2 = (void *)sub_1E46A6040();
  return (NSString *)v2;
}

+ (NSString)sectionBottomSeparatorKind
{
  v2 = (void *)sub_1E46A6040();
  return (NSString *)v2;
}

+ (NSString)itemSeparatorKind
{
  v2 = (void *)sub_1E46A6040();
  return (NSString *)v2;
}

- (SearchUISupplementaryIdentifiers)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUISupplementaryIdentifiers();
  return [(SearchUISupplementaryIdentifiers *)&v3 init];
}

@end