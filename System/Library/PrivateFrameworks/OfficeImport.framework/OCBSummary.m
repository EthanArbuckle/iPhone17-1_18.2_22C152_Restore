@interface OCBSummary
+ (void)readSummary:(id)a3 reader:(OcReader *)a4;
+ (void)writeSummary:(id)a3 writer:(OcWriter *)a4;
@end

@implementation OCBSummary

+ (void)readSummary:(id)a3 reader:(OcReader *)a4
{
  id v13 = a3;
  v5 = (OcSummary *)operator new(0x318uLL);
  OcSummary::OcSummary(v5);
  (*((void (**)(OcReader *, OcSummary *))a4->var0 + 4))(a4, v5);
  v6 = [NSString stringWithOcText:(char *)v5 + 8];
  [v13 setTitle:v6];

  v7 = [NSString stringWithOcText:(char *)v5 + 104];
  [v13 setAuthor:v7];

  v8 = [NSString stringWithOcText:(char *)v5 + 152];
  [v13 setKeywords:v8];

  v9 = [NSString stringWithOcText:(char *)v5 + 200];
  [v13 setComments:v9];

  v10 = [NSString stringWithOcText:(char *)v5 + 440];
  [v13 setHyperlinkBase:v10];

  v11 = [NSString stringWithOcText:(char *)v5 + 56];
  [v13 setSubject:v11];

  v12 = [NSString stringWithOcText:(char *)v5 + 632];
  [v13 setCompany:v12];

  if (v5) {
    (*(void (**)(OcSummary *))(*(void *)v5 + 8))(v5);
  }
}

+ (void)writeSummary:(id)a3 writer:(OcWriter *)a4
{
  id v11 = a3;
  v5 = (OcSummary *)operator new(0x318uLL);
  OcSummary::OcSummary(v5);
  v6 = [v11 title];
  [v6 copyToOcText:(char *)v5 + 8 encoding:65001];

  v7 = [v11 author];
  [v7 copyToOcText:(char *)v5 + 104 encoding:65001];

  v8 = [v11 keywords];
  [v8 copyToOcText:(char *)v5 + 152 encoding:65001];

  v9 = [v11 comments];
  [v9 copyToOcText:(char *)v5 + 200 encoding:65001];

  v10 = [v11 hyperlinkBase];
  [v10 copyToOcText:(char *)v5 + 440 encoding:1252];

  (*((void (**)(OcWriter *, OcSummary *))a4->var0 + 2))(a4, v5);
  if (v5) {
    (*(void (**)(OcSummary *))(*(void *)v5 + 8))(v5);
  }
}

@end