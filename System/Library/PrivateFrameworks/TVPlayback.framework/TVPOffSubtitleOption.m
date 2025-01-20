@interface TVPOffSubtitleOption
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)localizedDisplayString;
- (unint64_t)hash;
@end

@implementation TVPOffSubtitleOption

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return [@"Off" hash];
}

- (id)localizedDisplayString
{
  return 0;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(TVPSubtitleOption *)self avMediaSelectionOption];
  v4 = [v3 description];
  v5 = [v2 stringWithFormat:@"Off subtitle option with AVMediaSelectionOption: %@", v4];

  return v5;
}

@end