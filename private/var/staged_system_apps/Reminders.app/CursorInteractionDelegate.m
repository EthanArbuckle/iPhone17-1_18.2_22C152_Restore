@interface CursorInteractionDelegate
- (_TtC9RemindersP33_CB8DF1A557292041751C28CBB1A9D75525CursorInteractionDelegate)init;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation CursorInteractionDelegate

- (_TtC9RemindersP33_CB8DF1A557292041751C28CBB1A9D75525CursorInteractionDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CursorInteractionDelegate *)&v3 init];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_10015D7EC(v6);

  return v9;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_10015DD64(v8, v9);

  return v12;
}

@end