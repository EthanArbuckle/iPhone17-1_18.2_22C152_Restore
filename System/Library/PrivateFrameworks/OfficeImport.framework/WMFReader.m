@interface WMFReader
- (WMFReader)initWithWMFPlayer:(id)a3;
- (int)checkBytesAvailable:(unsigned int)a3;
- (int)moveDataCursor:(unsigned int)a3;
- (int)play:(id)a3;
- (int)playHeaders;
- (int)playRecord;
@end

@implementation WMFReader

- (WMFReader)initWithWMFPlayer:(id)a3
{
  return self;
}

- (int)play:(id)a3
{
  id v4 = a3;
  self->m_pBuffer = (const char *)[v4 bytes];
  self->m_length = [v4 length];
  self->m_cursor = 0;
  self->m_recordsRead = 0;
  int v5 = [(WMFReader *)self playHeaders];
  if (!v5)
  {
    while (1)
    {
      int v6 = [(WMFReader *)self playRecord];
      LOBYTE(v5) = (v6 == -7) | v5;
      if (v6 != -7)
      {
        if (v6) {
          break;
        }
      }
      ++self->m_recordsRead;
    }
    if (v5) {
      int v5 = -7;
    }
    else {
      int v5 = v6;
    }
  }
  [(WMFPlayer *)self->m_player done];

  return v5;
}

- (int)playHeaders
{
  uint64_t v3 = 18;
  int v4 = [(WMFReader *)self checkBytesAvailable:18];
  if (!v4)
  {
    if (*(_DWORD *)self->m_pBuffer == -1698247209) {
      uint64_t v3 = 40;
    }
    else {
      uint64_t v3 = 18;
    }
  }
  if ([(WMFReader *)self checkBytesAvailable:v3] | v4) {
    return -7;
  }
  int v6 = [(WMFPlayer *)self->m_player playHeader:v3 in_pRecord:self->m_pBuffer];
  [(WMFReader *)self moveDataCursor:v3];
  return v6;
}

- (int)checkBytesAvailable:(unsigned int)a3
{
  unint64_t v4 = self->m_cursor + (unint64_t)a3;
  int result = -2;
  if (!HIDWORD(v4))
  {
    if (self->m_length >= v4) {
      return 0;
    }
    else {
      return -2;
    }
  }
  return result;
}

- (int)moveDataCursor:(unsigned int)a3
{
  self->m_pBuffer += a3;
  self->m_cursor += a3;
  return 0;
}

- (int)playRecord
{
  if (self->m_cursor >= self->m_length) {
    return -2;
  }
  if ([(WMFReader *)self checkBytesAvailable:4]) {
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)self->m_pBuffer;
  if (v5 < 3) {
    return -2;
  }
  if ((v5 & 0x80000000) == 0)
  {
    uint64_t v3 = 2 * v5;
    if (![(WMFReader *)self checkBytesAvailable:v3])
    {
      int v4 = [(WMFPlayer *)self->m_player play:v3 in_pRecord:self->m_pBuffer];
      goto LABEL_4;
    }
  }
LABEL_3:
  uint64_t v3 = self->m_length - self->m_cursor;
  int v4 = -7;
LABEL_4:
  [(WMFReader *)self moveDataCursor:v3];
  return v4;
}

- (void).cxx_destruct
{
}

@end