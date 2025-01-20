@interface EKObject
- (id)eks_compoundIdentifier;
@end

@implementation EKObject

- (id)eks_compoundIdentifier
{
  v3 = sub_1000614D4(self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(EKObject *)self calendar];
    if (v4)
    {
      v5 = v4;
      v6 = [v4 calendarIdentifier];

      if (v6)
      {
        uint64_t v7 = +[NSString stringWithFormat:@"%@%@%@", v3, @"::", v6];

        v3 = (void *)v7;
      }
    }
  }

  return v3;
}

@end