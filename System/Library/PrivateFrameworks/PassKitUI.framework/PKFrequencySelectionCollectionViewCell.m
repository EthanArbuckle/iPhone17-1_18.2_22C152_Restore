@interface PKFrequencySelectionCollectionViewCell
- (_TtC9PassKitUI38PKFrequencySelectionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC9PassKitUI38PKFrequencySelectionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureWithOptions:(id)a3 selectedFrequency:(unint64_t)a4 selectedDate:(id)a5 isEditable:(BOOL)a6 titleColor:(id)a7 changeHandler:(id)a8;
@end

@implementation PKFrequencySelectionCollectionViewCell

- (void)configureWithOptions:(id)a3 selectedFrequency:(unint64_t)a4 selectedDate:(id)a5 isEditable:(BOOL)a6 titleColor:(id)a7 changeHandler:(id)a8
{
  id v36 = a7;
  BOOL v35 = a6;
  unint64_t v34 = a4;
  v32 = self;
  uint64_t v9 = sub_1A03AF108();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v9, v12);
  v13 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14, v15);
  v17 = (char *)&v31 - v16;
  v18 = _Block_copy(a8);
  uint64_t v31 = sub_1A03B4C58();
  v33 = v17;
  sub_1A03AF0A8();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v17, v9);
  unint64_t v21 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v22 = v21 + v11;
  v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = v20;
  unint64_t v24 = v34;
  *((void *)v23 + 3) = v31;
  *((void *)v23 + 4) = v24;
  v25 = v13;
  uint64_t v26 = v9;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v23[v21], v25, v9);
  v23[v22] = v35;
  v27 = v36;
  *(void *)&v23[(v22 & 0xFFFFFFFFFFFFFFF8) + 8] = v36;
  v28 = (void (**)())&v23[((v22 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8];
  *v28 = sub_19FB64AA4;
  v28[1] = (void (*)())v19;
  id v29 = v27;
  v30 = v32;
  sub_1A03AE138();
  sub_1A03ADE18();
  sub_1A03B5258();
  [(PKFrequencySelectionCollectionViewCell *)v30 setNeedsUpdateConfiguration];

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v33, v26);
}

- (_TtC9PassKitUI38PKFrequencySelectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PKFrequencySelectionCollectionViewCell();
  return -[PKFrequencySelectionCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9PassKitUI38PKFrequencySelectionCollectionViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PKFrequencySelectionCollectionViewCell();
  return [(PKFrequencySelectionCollectionViewCell *)&v5 initWithCoder:a3];
}

@end