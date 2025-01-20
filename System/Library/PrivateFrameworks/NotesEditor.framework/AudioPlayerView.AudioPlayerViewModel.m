@interface AudioPlayerView.AudioPlayerViewModel
- (void)audioControllerPlayPauseToggled:(id)a3;
- (void)audioControllerStopped:(id)a3;
- (void)audioControllerTimeChanged:(id)a3;
- (void)takeValuesViaNotification;
@end

@implementation AudioPlayerView.AudioPlayerViewModel

- (void)takeValuesViaNotification
{
  swift_retain();
  sub_20C0316F8();

  swift_release();
}

- (void)audioControllerTimeChanged:(id)a3
{
  uint64_t v3 = sub_20C15F200();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  swift_retain();
  sub_20C032A68();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)audioControllerPlayPauseToggled:(id)a3
{
  uint64_t v3 = sub_20C15F200();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  swift_retain();
  sub_20C032E54();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)audioControllerStopped:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  swift_getKeyPath();
  v8[1] = self;
  sub_20C036378(&qword_2676BCCE0, (void (*)(uint64_t))type metadata accessor for AudioPlayerView.AudioPlayerViewModel);
  swift_retain();
  sub_20C15FF30();
  swift_release();
  sub_20C035228();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end