@interface PKEventDetailsListView
+ (id)createWithItems:(id)a3;
- (PKEventDetailsListView)init;
@end

@implementation PKEventDetailsListView

+ (id)createWithItems:(id)a3
{
  type metadata accessor for EventDetailsListViewItem(0);
  sub_1A03B4C58();
  id v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E94B7DF0));
  v4 = (void *)sub_1A03B1E78();

  return v4;
}

- (PKEventDetailsListView)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EventDetailsListHostView();
  return [(PKEventDetailsListView *)&v3 init];
}

@end