@interface InternalProfileCharacteristicsViewController
- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB44InternalProfileCharacteristicsViewController)initWithCoder:(id)a3;
- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB44InternalProfileCharacteristicsViewController)initWithHealthStore:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation InternalProfileCharacteristicsViewController

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for InternalProfileCharacteristicsViewController();
  id v6 = v9.receiver;
  [(InternalProfileCharacteristicsViewController *)&v9 setEditing:v5 animated:v4];
  if (!v5)
  {
    id v7 = [v6 navigationController];
    if (v7)
    {
      id v8 = v7;
      [v7 dismissViewControllerAnimated:1 completion:0];

      id v6 = v8;
    }
  }
}

- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB44InternalProfileCharacteristicsViewController)initWithHealthStore:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InternalProfileCharacteristicsViewController();
  return [(InternalProfileCharacteristicsViewController *)&v5 initWithHealthStore:a3];
}

- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB44InternalProfileCharacteristicsViewController)initWithCoder:(id)a3
{
  return (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB44InternalProfileCharacteristicsViewController *)sub_100040B0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))type metadata accessor for InternalProfileCharacteristicsViewController);
}

@end