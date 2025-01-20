@interface MPMediaItemCollection
- (id)description;
@end

@implementation MPMediaItemCollection

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MPMediaItemCollection *)self items];
  v6 = +[NSString stringWithFormat:@"<%@(%p) %@>", v4, self, v5];

  return v6;
}

@end