@interface TTRIEditSectionsCell
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (UICellConfigurationState)_bridgedConfigurationState;
- (_TtC9Reminders20TTRIEditSectionsCell)initWithCoder:(id)a3;
- (_TtC9Reminders20TTRIEditSectionsCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation TTRIEditSectionsCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v8 = self;
  v9 = [(TTRIEditSectionsCell *)&v12 _bridgedConfigurationState];
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1000AE6F8((uint64_t)v8 + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_viewModel, (uint64_t)v13);
  sub_1000AE85C((uint64_t)v13, (void (*)(void, void, void, void, void, void))sub_1000AE6AC);
  sub_1000AE760((uint64_t)v13);
  sub_1000AE85C((uint64_t)v13, (void (*)(void, void, void, void, void, void))sub_1000AE89C);

  v10.super.super.isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return (UICellConfigurationState *)v10.super.super.isa;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1000AC6B0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isAccessibilityElement
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_displayNameField) isEditing] ^ 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1000ADFE4(self, (uint64_t)a2, (void (*)(void))sub_1000ADA00);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1000ADFE4(self, (uint64_t)a2, (void (*)(void))sub_1000ADC34);
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1000ADFE4(self, (uint64_t)a2, (void (*)(void))sub_1000AE064);
}

- (void)setAccessibilityHint:(id)a3
{
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  char v3 = sub_1000AE1AC();

  return v3 & 1;
}

- (_TtC9Reminders20TTRIEditSectionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders20TTRIEditSectionsCell *)sub_1000AE2EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders20TTRIEditSectionsCell)initWithCoder:(id)a3
{
  return (_TtC9Reminders20TTRIEditSectionsCell *)sub_1000AE450(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_displayNameField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_canonicalNameField));
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_accessibilityDelegate);
  sub_1000AE89C(*(void **)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_nameFields));

  swift_bridgeObjectRelease();
}

@end