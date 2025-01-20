@interface MSVLyricsAgent
- (BOOL)isEqual:(id)a3;
@end

@implementation MSVLyricsAgent

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_AB7E30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = MSVLyricsAgent.isEqual(_:)((uint64_t)v8);

  sub_1A538((uint64_t)v8, &qword_DF52B0);
  return v6 & 1;
}

@end