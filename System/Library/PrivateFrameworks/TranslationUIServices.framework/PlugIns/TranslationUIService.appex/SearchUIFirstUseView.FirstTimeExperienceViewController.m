@interface SearchUIFirstUseView.FirstTimeExperienceViewController
- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithCoder:(id)a3;
- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithDomains:(id)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6;
- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithStyle:(unint64_t)a3 supportedDomains:(unint64_t)a4 explanationText:(id)a5 learnMoreText:(id)a6 continueButtonTitle:(id)a7;
- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithSupportedDomains:(unint64_t)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6;
- (void)viewWillLayoutSubviews;
@end

@implementation SearchUIFirstUseView.FirstTimeExperienceViewController

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1000141DC();
}

- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithDomains:(id)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6
{
  uint64_t v8 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v9 = sub_100049F68();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v8 = sub_100049EA8();
      uint64_t v11 = v10;
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v13 = 0;
      if (a6) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v14 = 0;
      uint64_t v16 = 0;
      return (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController *)sub_100014358(v9, v8, v11, (uint64_t)a5, v13, v14, v16);
    }
  }
  uint64_t v11 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  a5 = (id)sub_100049EA8();
  uint64_t v13 = v12;
  if (!a6) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v14 = sub_100049EA8();
  uint64_t v16 = v15;
  return (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController *)sub_100014358(v9, v8, v11, (uint64_t)a5, v13, v14, v16);
}

- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithSupportedDomains:(unint64_t)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6
{
  uint64_t v7 = (uint64_t)a5;
  if (a4)
  {
    uint64_t v9 = sub_100049EA8();
    uint64_t v11 = v10;
    if (v7) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController *)sub_100014580(a3, v9, v11, v7, v13, v14, v16);
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = sub_100049EA8();
  uint64_t v13 = v12;
  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v14 = sub_100049EA8();
  uint64_t v16 = v15;
  return (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController *)sub_100014580(a3, v9, v11, v7, v13, v14, v16);
}

- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithStyle:(unint64_t)a3 supportedDomains:(unint64_t)a4 explanationText:(id)a5 learnMoreText:(id)a6 continueButtonTitle:(id)a7
{
  uint64_t v8 = (uint64_t)a6;
  if (a5)
  {
    uint64_t v11 = sub_100049EA8();
    uint64_t v13 = v12;
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v15 = 0;
    if (a7) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    return (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController *)sub_100014758(a3, a4, v11, v13, v8, v15, v16, v18);
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = sub_100049EA8();
  uint64_t v15 = v14;
  if (!a7) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v16 = sub_100049EA8();
  uint64_t v18 = v17;
  return (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController *)sub_100014758(a3, a4, v11, v13, v8, v15, v16, v18);
}

- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100049EA8();
    v6 = &self->SearchUIFirstTimeExperienceViewController_opaque[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize];
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    id v7 = a4;
    NSString v8 = sub_100049E78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = &self->SearchUIFirstTimeExperienceViewController_opaque[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize];
    *(_OWORD *)uint64_t v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController();
  uint64_t v11 = [(SearchUIFirstUseView.FirstTimeExperienceViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController)initWithCoder:(id)a3
{
  v5 = &self->SearchUIFirstTimeExperienceViewController_opaque[OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView33FirstTimeExperienceViewController_fittingSize];
  TimeExperienceViewController = (objc_class *)type metadata accessor for SearchUIFirstUseView.FirstTimeExperienceViewController();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v8.receiver = self;
  v8.super_class = TimeExperienceViewController;
  return [(SearchUIFirstUseView.FirstTimeExperienceViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end