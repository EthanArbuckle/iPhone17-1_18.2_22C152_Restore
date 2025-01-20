@interface TranscriptViewContextProvider
- (void)didChangeHostViewWidth:(double)a3;
- (void)willCollapseTranscriptView;
- (void)willExpandTranscriptView;
@end

@implementation TranscriptViewContextProvider

- (void)willExpandTranscriptView
{
  uint64_t v2 = *(void *)&self->context[8];
  uint64_t v3 = self->context[16];
  int v4 = self->context[17];
  int v5 = self->context[18];
  int v6 = self->context[19];
  int v7 = self->context[20];
  double v8 = *(double *)&self->context[24];
  self->context[17] = v4;
  self->context[18] = v5;
  self->context[19] = v6;
  self->context[20] = 1;
  uint64_t v9 = *(unsigned __int16 *)self->context;
  sub_100015758(v2, v3);
  sub_100015758(v2, v3);
  sub_100015758(v2, v3);
  swift_retain();
  sub_10001576C(v2, v3);
  uint64_t v10 = 256;
  if (!v4) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v10 | v3;
  uint64_t v12 = 0x10000;
  if (!v5) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = 0x1000000;
  if (!v6) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v11 | v12 | v13;
  v15 = &_mh_execute_header;
  if (!v7) {
    v15 = 0;
  }
  sub_100015780(v9, v2, v14 | (unint64_t)v15, v8);
  sub_10001576C(v2, v3);
  sub_10001576C(v2, v3);

  swift_release();
}

- (void)willCollapseTranscriptView
{
  uint64_t v2 = *(void *)&self->context[8];
  uint64_t v3 = self->context[16];
  int v4 = self->context[17];
  int v5 = self->context[18];
  int v6 = self->context[19];
  int v7 = self->context[20];
  double v8 = *(double *)&self->context[24];
  self->context[17] = v4;
  self->context[18] = v5;
  *(_WORD *)&self->context[19] = v6;
  uint64_t v9 = *(unsigned __int16 *)self->context;
  sub_100015758(v2, v3);
  sub_100015758(v2, v3);
  sub_100015758(v2, v3);
  swift_retain();
  sub_10001576C(v2, v3);
  uint64_t v10 = 256;
  if (!v4) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v10 | v3;
  uint64_t v12 = 0x10000;
  if (!v5) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = 0x1000000;
  if (!v6) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v11 | v12 | v13;
  v15 = &_mh_execute_header;
  if (!v7) {
    v15 = 0;
  }
  sub_100015780(v9, v2, v14 | (unint64_t)v15, v8);
  sub_10001576C(v2, v3);
  sub_10001576C(v2, v3);

  swift_release();
}

- (void)didChangeHostViewWidth:(double)a3
{
  uint64_t v3 = *(void *)&self->context[8];
  uint64_t v4 = self->context[16];
  int v5 = self->context[17];
  int v6 = self->context[18];
  int v7 = self->context[19];
  int v8 = self->context[20];
  double v9 = *(double *)&self->context[24];
  self->context[17] = v5;
  self->context[18] = v6;
  self->context[19] = v7;
  self->context[20] = v8;
  *(double *)&self->context[24] = a3;
  uint64_t v10 = *(unsigned __int16 *)self->context;
  sub_100015758(v3, v4);
  sub_100015758(v3, v4);
  sub_100015758(v3, v4);
  swift_retain();
  sub_10001576C(v3, v4);
  uint64_t v11 = 256;
  if (!v5) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v11 | v4;
  uint64_t v13 = 0x10000;
  if (!v6) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = 0x1000000;
  if (!v7) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v12 | v13 | v14;
  v16 = &_mh_execute_header;
  if (!v8) {
    v16 = 0;
  }
  sub_100015780(v10, v3, v15 | (unint64_t)v16, v9);
  sub_10001576C(v3, v4);
  sub_10001576C(v3, v4);

  swift_release();
}

@end