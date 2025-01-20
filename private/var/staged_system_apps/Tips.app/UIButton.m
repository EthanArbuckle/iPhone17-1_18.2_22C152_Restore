@interface UIButton
- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5;
- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5 symbolName:(id)a6;
- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5 symbolName:(id)a6 fontWeight:(double)a7;
- (void)setupActionButtonConfigurationWithTitle:(id)a3 isEnabled:(BOOL)a4;
- (void)setupReplayButtonConfiguration;
@end

@implementation UIButton

- (void)setupActionButtonConfigurationWithTitle:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_10001C28C(&qword_1000C89B8);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = self;
  v13 = self;
  id v14 = [v12 systemBlueColor];
  id v15 = [v12 secondarySystemBackgroundColor];
  sub_10003F4F4(v9, v11, v14, v15, 0, 0, v4);

  uint64_t v16 = type metadata accessor for UIButton.Configuration();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v8, 0, 1, v16);
  UIButton.configuration.setter();

  swift_bridgeObjectRelease();
}

- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5
{
  uint64_t v8 = sub_10001C28C(&qword_1000C89B8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = self;
  sub_10003F4F4(v11, v13, v14, v15, 0, 0, 1);
  uint64_t v17 = type metadata accessor for UIButton.Configuration();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 0, 1, v17);
  UIButton.configuration.setter();

  swift_bridgeObjectRelease();
}

- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5 symbolName:(id)a6
{
  uint64_t v9 = sub_10001C28C(&qword_1000C89B8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  id v18 = a4;
  id v19 = a5;
  v20 = self;
  sub_10003F4F4(v12, v14, v18, v19, v15, v17, 1);
  uint64_t v21 = type metadata accessor for UIButton.Configuration();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v11, 0, 1, v21);
  UIButton.configuration.setter();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5 symbolName:(id)a6 fontWeight:(double)a7
{
  uint64_t v10 = sub_10001C28C(&qword_1000C89B8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  id v19 = a4;
  id v20 = a5;
  uint64_t v21 = self;
  sub_10003F4F4(v13, v15, v19, v20, v16, v18, 1);
  uint64_t v22 = type metadata accessor for UIButton.Configuration();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 0, 1, v22);
  UIButton.configuration.setter();
  v23 = [(UIButton *)v21 titleLabel];
  [(UILabel *)v23 setAdjustsFontForContentSizeCategory:1];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)setupReplayButtonConfiguration
{
  uint64_t v3 = sub_10001C28C(&qword_1000C89B8);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  sub_100040234((uint64_t)v5);
  uint64_t v7 = type metadata accessor for UIButton.Configuration();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
  UIButton.configuration.setter();
}

@end