@interface SBRootSettings
- (SBAttentionAwarenessSettings)attentionAwarenessSettings;
- (void)setAttentionAwarenessSettings:(id)a3;
@end

@implementation SBRootSettings

- (SBAttentionAwarenessSettings)attentionAwarenessSettings
{
  return (SBAttentionAwarenessSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttentionAwarenessSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end