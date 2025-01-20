@interface TPSSavedTipsManager
+ (TPSSavedTipsManager)sharedInstance;
- (BOOL)isCurrentTipSaved;
- (BOOL)isSavedWithTipIdentifier:(id)a3;
- (TPSSavedTipsManager)init;
- (TPSTip)currentTip;
- (id)identifiers;
- (id)savedDateWithCorrelationId:(id)a3;
- (void)removeInvalidEntries;
- (void)setCurrentTip:(id)a3;
- (void)setIsCurrentTipSaved:(BOOL)a3;
- (void)toggleSavedTipWithCorrelationId:(id)a3 tipIdentifier:(id)a4;
- (void)updateSavedTipsWithCorrelationId:(id)a3 tipIdentifier:(id)a4 savedDate:(id)a5 lastUsedVersion:(id)a6;
@end

@implementation TPSSavedTipsManager

- (id)savedDateWithCorrelationId:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  MEMORY[0x1F4188790]();
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_19C9768B0();
  v14 = self;
  uint64_t v15 = v6;
  uint64_t v16 = v7;
  v8 = self;
  sub_19C976BF0();

  swift_bridgeObjectRelease();
  uint64_t v9 = sub_19C976560();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) != 1)
  {
    v11 = (void *)sub_19C976510();
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v5, v9);
  }
  return v11;
}

+ (TPSSavedTipsManager)sharedInstance
{
  if (qword_1EB516C38 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB516C28;
  return (TPSSavedTipsManager *)v2;
}

- (TPSTip)currentTip
{
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  v3 = self;
  sub_19C9765E0();
  swift_release();
  uint64_t v4 = (id *)((char *)&v3->super.isa + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  v5 = (TPSTip *)*v4;

  return v5;
}

- (void)setCurrentTip:(id)a3
{
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  id v5 = a3;
  uint64_t v6 = self;
  sub_19C9765D0();

  swift_release();
}

- (BOOL)isCurrentTipSaved
{
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  v3 = self;
  sub_19C9765E0();
  swift_release();
  uint64_t v4 = (char *)v3 + OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved;
  swift_beginAccess();
  LOBYTE(v4) = *v4;

  return (char)v4;
}

- (void)setIsCurrentTipSaved:(BOOL)a3
{
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  uint64_t v4 = self;
  sub_19C9765D0();

  swift_release();
}

- (TPSSavedTipsManager)init
{
  return (TPSSavedTipsManager *)TPSSavedTipsManager.init()();
}

- (BOOL)isSavedWithTipIdentifier:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_19C9768B0();
  }
  else {
    uint64_t v4 = 0;
  }
  MEMORY[0x1F4188790](v4);
  id v5 = self;
  sub_19C976BF0();

  swift_bridgeObjectRelease();
  return v7;
}

- (void)toggleSavedTipWithCorrelationId:(id)a3 tipIdentifier:(id)a4
{
  uint64_t v5 = sub_19C9768B0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_19C9768B0();
  uint64_t v10 = v9;
  v11 = self;
  sub_19C94C638(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateSavedTipsWithCorrelationId:(id)a3 tipIdentifier:(id)a4 savedDate:(id)a5 lastUsedVersion:(id)a6
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_19C9768B0();
  uint64_t v13 = v12;
  uint64_t v14 = sub_19C9768B0();
  uint64_t v16 = v15;
  if (a5)
  {
    sub_19C976530();
    uint64_t v17 = sub_19C976560();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_19C976560();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
  }
  uint64_t v19 = sub_19C9768B0();
  uint64_t v21 = v20;
  v22 = self;
  sub_19C94CC60(v11, v13, v14, v16, (uint64_t)v10, v19, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19C93DCC8((uint64_t)v10);
}

- (id)identifiers
{
  v2 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516A10);
  sub_19C976BF0();

  v3 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)removeInvalidEntries
{
  v2 = self;
  sub_19C94DC70();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TPSSavedTipsManager___observationRegistrar;
  uint64_t v4 = sub_19C976620();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end