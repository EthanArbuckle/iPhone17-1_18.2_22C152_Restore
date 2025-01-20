@interface RSDoorWindowOnlineDetector
- (RSDoorWindowOnlineDetector)init;
- (id).cxx_construct;
@end

@implementation RSDoorWindowOnlineDetector

- (id).cxx_construct
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doorWindowDetector, 0);
  sub_25B47D2E8((id *)&self->_merger_for_open_door._vptr$MergerForDoorWindow);
  sub_25B47D2E8((id *)&self->_merger_for_close_door_window._vptr$MergerForDoorWindow);
  sub_25B47D1E4((uint64_t)&self->_open_selector_for_door_window);

  sub_25B47D1E4((uint64_t)&self->_wall_selector_for_door_window);
}

- (RSDoorWindowOnlineDetector)init
{
  v8.receiver = self;
  v8.super_class = (Class)RSDoorWindowOnlineDetector;
  v2 = [(RSDoorWindowOnlineDetector *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_anon_68[112] = 1;
    uint64_t v4 = objc_opt_new();
    doorWindowDetector = v3->_doorWindowDetector;
    v3->_doorWindowDetector = (RSOrthographicDetector *)v4;

    v6 = v3->_doorWindowDetector;
    if (v6) {
      v6->normalizedOutput = 0;
    }
  }
  return v3;
}

@end