@interface TextViewWrapper.Coordinator
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper11Coordinator)init;
@end

@implementation TextViewWrapper.Coordinator

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8 = sub_2616A8EB8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2616A8EA8();
  id v12 = a3;
  v13 = self;
  char v14 = sub_261594BB8((uint64_t)v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14 & 1;
}

- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper11Coordinator)init
{
}

- (void).cxx_destruct
{
}

@end