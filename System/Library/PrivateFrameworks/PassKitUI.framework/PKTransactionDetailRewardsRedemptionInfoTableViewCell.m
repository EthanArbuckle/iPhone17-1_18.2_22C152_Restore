@interface PKTransactionDetailRewardsRedemptionInfoTableViewCell
- (_TtC9PassKitUI53PKTransactionDetailRewardsRedemptionInfoTableViewCell)initWithCoder:(id)a3;
- (_TtC9PassKitUI53PKTransactionDetailRewardsRedemptionInfoTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithRewardsRedemption:(id)a3 rewardsBalance:(id)a4;
@end

@implementation PKTransactionDetailRewardsRedemptionInfoTableViewCell

- (void)configureWithRewardsRedemption:(id)a3 rewardsBalance:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B05D8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v16 = a3;
  id v17 = a4;
  sub_19FA80A00();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1A03B2D28();
  sub_1A03B3088();
  v18[3] = v7;
  v18[4] = sub_19F48B884(&qword_1E94B05E8, &qword_1E94B05D8);
  __swift_allocate_boxed_opaque_existential_1(v18);
  sub_1A03B2D18();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);
  MEMORY[0x1A621F630](v18);
}

- (_TtC9PassKitUI53PKTransactionDetailRewardsRedemptionInfoTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1A03B4988();
    a4 = (id)sub_1A03B4958();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(PKTransactionDetailRewardsRedemptionInfoTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC9PassKitUI53PKTransactionDetailRewardsRedemptionInfoTableViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(PKTransactionDetailRewardsRedemptionInfoTableViewCell *)&v5 initWithCoder:a3];
}

@end