@interface _UTSwiftOverlayRuntimeIssuesAssistant
+ (void)dsoHandle;
- (_UTSwiftOverlayRuntimeIssuesAssistant)init;
@end

@implementation _UTSwiftOverlayRuntimeIssuesAssistant

+ (void)dsoHandle
{
  return &dword_212806000;
}

- (_UTSwiftOverlayRuntimeIssuesAssistant)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UTSwiftOverlayRuntimeIssuesAssistant();
  return [(_UTSwiftOverlayRuntimeIssuesAssistant *)&v3 init];
}

@end