@interface TransitDirectionsBlockTransferCell
+ (Class)stepViewClass;
- (void)configureWithItem:(id)a3;
@end

@implementation TransitDirectionsBlockTransferCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (void)configureWithItem:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsBlockTransferCell;
  [(TransitDirectionsCell *)&v3 configureWithItem:a3];
}

@end