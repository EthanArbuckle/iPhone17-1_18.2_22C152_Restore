@interface G2PFactoredInternal
- (G2PFactoredInternal)init;
- (id)getPronounciationStringWithWord:(id)a3 error:(id *)a4;
- (id)getPronounciationWithWord:(id)a3 error:(id *)a4;
@end

@implementation G2PFactoredInternal

- (id)getPronounciationStringWithWord:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_2614D53A8();
  uint64_t v7 = v6;
  v8 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x68);
  v9 = self;
  v8(v5, v7);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v10 = (void *)sub_2614D5378();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)getPronounciationWithWord:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_2614D53A8();
  uint64_t v7 = v6;
  v8 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x68);
  v9 = self;
  v8(v5, v7);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v10 = (void *)sub_2614D5648();
  swift_bridgeObjectRelease();
  return v10;
}

- (G2PFactoredInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for G2PFactored();
  return [(G2PFactoredInternal *)&v3 init];
}

@end