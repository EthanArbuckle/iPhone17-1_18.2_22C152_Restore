@interface PKFindMyEventLinkView
+ (id)createWithEventName:(id)a3;
- (PKFindMyEventLinkView)init;
@end

@implementation PKFindMyEventLinkView

+ (id)createWithEventName:(id)a3
{
  sub_1A03B4988();
  id v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E94B8250));
  v4 = (void *)sub_1A03B1E78();

  return v4;
}

- (PKFindMyEventLinkView)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FindMyEventLinkViewHost();
  return [(PKFindMyEventLinkView *)&v3 init];
}

@end