@interface FormatterUtils
+ (id)localizedSizeStringFor:(double)a3 unitStyle:(int64_t)a4;
+ (id)totalSizeStringFor:(id)a3;
- (_TtC13iCloudQuotaUI14FormatterUtils)init;
@end

@implementation FormatterUtils

+ (id)localizedSizeStringFor:(double)a3 unitStyle:(int64_t)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3668);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(self, sel_bytes);
  sub_22C8BA084(0, &qword_2684D3670);
  sub_22C9A1328();
  if (qword_2684E0358 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_2684E0BE8, sel_setUnitStyle_, a4);
  sub_22C9A3B48();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = (void *)sub_22C9A3688();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)totalSizeStringFor:(id)a3
{
  sub_22C8BA084(0, &qword_2684D1448);
  unint64_t v3 = sub_22C9A3858();
  sub_22C98E208(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_22C9A3688();
  swift_bridgeObjectRelease();
  return v4;
}

- (_TtC13iCloudQuotaUI14FormatterUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FormatterUtils();
  return [(FormatterUtils *)&v3 init];
}

@end