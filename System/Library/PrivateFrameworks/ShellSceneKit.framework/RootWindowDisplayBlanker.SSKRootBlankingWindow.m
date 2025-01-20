@interface RootWindowDisplayBlanker.SSKRootBlankingWindow
- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithCoder:(id)a3;
- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithDisplay:(id)a3;
- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithFrame:(CGRect)a3;
- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithScreen:(id)a3;
- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithWindowScene:(id)a3;
@end

@implementation RootWindowDisplayBlanker.SSKRootBlankingWindow

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithDisplay:(id)a3
{
  return (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow *)sub_25C45DCA4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithDisplay_);
}

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithScreen:(id)a3
{
  return (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow *)sub_25C45DCA4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithScreen_);
}

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow();
  return [(RootWindowDisplayBlanker.SSKRootBlankingWindow *)&v5 initWithWindowScene:a3];
}

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow();
  return -[RootWindowDisplayBlanker.SSKRootBlankingWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow)initWithCoder:(id)a3
{
  return (_TtCC13ShellSceneKit24RootWindowDisplayBlankerP33_0643C91F8C325C0A70278AB1F0B65E8F21SSKRootBlankingWindow *)sub_25C45DCA4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end