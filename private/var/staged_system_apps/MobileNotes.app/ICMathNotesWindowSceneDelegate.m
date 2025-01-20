@interface ICMathNotesWindowSceneDelegate
- (ICMathNotesWindowSceneDelegate)init;
- (void)ic_sceneDidDisconnect:(id)a3;
- (void)ic_setupWithScene:(id)a3 options:(id)a4;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
@end

@implementation ICMathNotesWindowSceneDelegate

- (void)ic_setupWithScene:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10048C54C((uint64_t)v6);
}

- (void)ic_sceneDidDisconnect:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10048BFF4(v4);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10048C304(v4);
}

- (ICMathNotesWindowSceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MathNotesSceneDelegate();
  return [(ICMathNotesWindowSceneDelegate *)&v3 init];
}

@end