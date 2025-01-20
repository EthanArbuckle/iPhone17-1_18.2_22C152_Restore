@interface PhotosDynamicHeaderContentView.Proxy
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy)init;
- (id)makeInternalMenuWithPresentationEnvironment:(id)a3;
@end

@implementation PhotosDynamicHeaderContentView.Proxy

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v7 = MEMORY[0x1AD10DA80]((char *)self+ OBJC_IVAR____TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy_target, a2);
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = a3;
    id v10 = a4;
    v11 = self;
    BOOL v12 = sub_1AA1361F4(v9);
  }
  else
  {
    return 0;
  }
  return v12;
}

- (id)makeInternalMenuWithPresentationEnvironment:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_1AA12F598();
  swift_unknownObjectRelease();

  return v5;
}

- (_TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy)init
{
  result = (_TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end