@interface SLConversationAttributionView
- (SLConversationAttributionView)initWithCoder:(id)a3;
- (SLConversationAttributionView)initWithHighlight:(id)a3 variant:(int64_t)a4;
- (SLConversationAttributionView)initWithVariant:(int64_t)a3;
@end

@implementation SLConversationAttributionView

- (SLConversationAttributionView)initWithVariant:(int64_t)a3
{
  result = (SLConversationAttributionView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (SLConversationAttributionView)initWithHighlight:(id)a3 variant:(int64_t)a4
{
  id v4 = a3;
  v5 = (SLConversationAttributionView *)specialized CollaborationAttributionView.init(highlight:variant:)(v4, 2);

  return v5;
}

- (SLConversationAttributionView)initWithCoder:(id)a3
{
  return 0;
}

@end