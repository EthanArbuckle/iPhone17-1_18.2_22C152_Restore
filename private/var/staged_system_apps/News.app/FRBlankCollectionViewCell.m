@interface FRBlankCollectionViewCell
+ (id)reuseIdentifier;
- (BOOL)isUserInteractionEnabled;
@end

@implementation FRBlankCollectionViewCell

+ (id)reuseIdentifier
{
  return @"FRBlankCollectionViewCell";
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

@end