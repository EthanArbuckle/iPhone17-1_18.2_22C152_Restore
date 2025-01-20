@interface _BCExternalURLOpenPrompterResponseValue
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
@end

@implementation _BCExternalURLOpenPrompterResponseValue

- (BOOL)beginContentAccess
{
  return 1;
}

- (BOOL)isContentDiscarded
{
  return 0;
}

@end