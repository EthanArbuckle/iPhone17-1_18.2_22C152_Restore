@interface ScriptUpdateServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC24MusicScriptUpdateService27ScriptUpdateServiceDelegate)init;
@end

@implementation ScriptUpdateServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = [v7 interfaceWithProtocol:&OBJC_PROTOCOL____TtP24MusicScriptUpdateService32MusicScriptUpdateServiceProtocol_];
  [v9 setExportedInterface:v11];

  id v12 = [objc_allocWithZone((Class)type metadata accessor for MusicScriptUpdateService()) init];
  [v9 setExportedObject:v12];

  [v9 resume];
  return 1;
}

- (_TtC24MusicScriptUpdateService27ScriptUpdateServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScriptUpdateServiceDelegate();
  return [(ScriptUpdateServiceDelegate *)&v3 init];
}

@end