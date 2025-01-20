@interface SBHClockApplicationIcon
+ (BOOL)_shouldAnimateInLocation:(id)a3;
- (Class)iconImageViewClassForLocation:(id)a3;
@end

@implementation SBHClockApplicationIcon

- (Class)iconImageViewClassForLocation:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _shouldAnimateInLocation:v4])
  {
    uint64_t v5 = self;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHClockApplicationIcon;
    uint64_t v5 = [(SBIcon *)&v8 iconImageViewClassForLocation:v4];
  }
  v6 = (void *)v5;

  return (Class)v6;
}

+ (BOOL)_shouldAnimateInLocation:(id)a3
{
  return [a3 isEqualToString:@"SBIconLocationAppLibrarySearch"] ^ 1;
}

@end