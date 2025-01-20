@interface InternalMedicalIDViewController
- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB31InternalMedicalIDViewController)initWithCoder:(id)a3;
- (id)initInEditMode:(BOOL)a3 inBuddy:(BOOL)a4 organDonationSignupAvailable:(BOOL)a5;
- (void)medicalIDViewControllerDidCancel:(void *)a3;
- (void)medicalIDViewControllerDidDelete:(id)a3;
@end

@implementation InternalMedicalIDViewController

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100040894(a3);
}

- (void)medicalIDViewControllerDidCancel:(void *)a3
{
  if (a3)
  {
    id v7 = a1;
    id v4 = a3;
    id v5 = [v4 navigationController];
    if (v5)
    {
      id v6 = v5;
      [v5 dismissViewControllerAnimated:1 completion:0];

      id v4 = v7;
      id v7 = v6;
    }
  }
  else
  {
    __break(1u);
  }
}

- (id)initInEditMode:(BOOL)a3 inBuddy:(BOOL)a4 organDonationSignupAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for InternalMedicalIDViewController();
  return [(InternalMedicalIDViewController *)&v9 initInEditMode:v7 inBuddy:v6 organDonationSignupAvailable:v5];
}

- (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB31InternalMedicalIDViewController)initWithCoder:(id)a3
{
  return (_TtC6HealthP33_20B3255B537141CA25842A215889B6DB31InternalMedicalIDViewController *)sub_100040B0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))type metadata accessor for InternalMedicalIDViewController);
}

@end