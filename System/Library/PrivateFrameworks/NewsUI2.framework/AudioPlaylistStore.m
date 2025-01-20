@interface AudioPlaylistStore
- (void)audioPlaylistDidChange:(id)a3;
@end

@implementation AudioPlaylistStore

- (void)audioPlaylistDidChange:(id)a3
{
  sub_1DE919914(0, (unint64_t *)&qword_1EBABB0D0);
  swift_unknownObjectRetain();
  swift_retain();
  v3 = (void *)sub_1DFDFF620();
  sub_1DFDFEA60();
  sub_1DFDF00C0();

  swift_retain();
  sub_1DFDEE310();
  swift_unknownObjectRelease();
  swift_release_n();
}

@end