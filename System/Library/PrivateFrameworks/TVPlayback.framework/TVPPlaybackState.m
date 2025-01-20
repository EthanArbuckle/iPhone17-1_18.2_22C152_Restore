@interface TVPPlaybackState
+ (id)loading;
+ (id)paused;
+ (id)playing;
+ (id)scanning;
+ (id)stopped;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (TVPPlaybackState)init;
- (TVPPlaybackState)initWithName:(id)a3;
- (void)setName:(id)a3;
@end

@implementation TVPPlaybackState

+ (id)stopped
{
  if (stopped_onceToken != -1) {
    dispatch_once(&stopped_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)stopped_state;
  return v2;
}

uint64_t __27__TVPPlaybackState_stopped__block_invoke()
{
  stopped_state = [[TVPPlaybackState alloc] initWithName:@"Stopped"];
  return MEMORY[0x270F9A758]();
}

+ (id)loading
{
  if (loading_onceToken != -1) {
    dispatch_once(&loading_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)loading_state;
  return v2;
}

uint64_t __27__TVPPlaybackState_loading__block_invoke()
{
  loading_state = [[TVPPlaybackState alloc] initWithName:@"Loading"];
  return MEMORY[0x270F9A758]();
}

+ (id)paused
{
  if (paused_onceToken != -1) {
    dispatch_once(&paused_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)paused_state;
  return v2;
}

uint64_t __26__TVPPlaybackState_paused__block_invoke()
{
  paused_state = [[TVPPlaybackState alloc] initWithName:@"Paused"];
  return MEMORY[0x270F9A758]();
}

+ (id)playing
{
  if (playing_onceToken != -1) {
    dispatch_once(&playing_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)playing_state;
  return v2;
}

uint64_t __27__TVPPlaybackState_playing__block_invoke()
{
  playing_state = [[TVPPlaybackState alloc] initWithName:@"Playing"];
  return MEMORY[0x270F9A758]();
}

+ (id)scanning
{
  if (scanning_onceToken != -1) {
    dispatch_once(&scanning_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)scanning_state;
  return v2;
}

uint64_t __28__TVPPlaybackState_scanning__block_invoke()
{
  scanning_state = [[TVPPlaybackState alloc] initWithName:@"Scanning"];
  return MEMORY[0x270F9A758]();
}

- (TVPPlaybackState)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"Unimplemented", @"-[ATVPlaybackState init] not supported, use singletons instead", 0 reason userInfo];
  objc_exception_throw(v2);
}

- (TVPPlaybackState)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPPlaybackState;
  v6 = [(TVPPlaybackState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [v4 name];
    v6 = [(TVPPlaybackState *)self name];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end