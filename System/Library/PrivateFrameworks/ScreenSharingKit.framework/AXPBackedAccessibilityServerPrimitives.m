@interface AXPBackedAccessibilityServerPrimitives
- (_TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives)init;
- (id)accessibilityTranslationTransportAddReceiveDataHandler:(id)a3;
- (void)accessibilityTranslationTransportCancel;
- (void)accessibilityTranslationTransportSendData:(NSData *)a3 completionHandler:(id)a4;
@end

@implementation AXPBackedAccessibilityServerPrimitives

- (_TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives_axpTransportDataHandler);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = OBJC_IVAR____TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives_accessibilityDataSubject;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A539C70);
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_25BC080B8();
  *(Class *)((char *)&v5->super.isa
           + OBJC_IVAR____TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives_axpManager) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for AXPBackedAccessibilityServerPrimitives();
  return [(AXPBackedAccessibilityServerPrimitives *)&v7 init];
}

- (void).cxx_destruct
{
  sub_25BAC0948(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives_axpTransportDataHandler));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives_axpManager);
}

- (void)accessibilityTranslationTransportSendData:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537E50);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_25BC08928();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A539C98;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A5383B8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_25BB6B660((uint64_t)v9, (uint64_t)&unk_26A5383C0, (uint64_t)v14);
  swift_release();
}

- (id)accessibilityTranslationTransportAddReceiveDataHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)self
                                                                + OBJC_IVAR____TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives_axpTransportDataHandler);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16ScreenSharingKit38AXPBackedAccessibilityServerPrimitives_axpTransportDataHandler);
  *v6 = sub_25BB6B918;
  v6[1] = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v5;
  uint64_t v8 = self;
  swift_retain();
  sub_25BAC0948(v7);
  swift_release();
  return v8;
}

- (void)accessibilityTranslationTransportCancel
{
  uint64_t v2 = qword_26A536DB8;
  v6 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25BC08058();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A539868);
  v4._countAndFlagsBits = 0xD000000000000093;
  v4._object = (void *)0x800000025BC1F000;
  v5._object = (void *)0x800000025BC1F0A0;
  v5._countAndFlagsBits = 0xD000000000000029;
  Logger.debugMarker(_:line:function:message:)(v4, 67, v5, (Swift::String_optional)0);
}

@end