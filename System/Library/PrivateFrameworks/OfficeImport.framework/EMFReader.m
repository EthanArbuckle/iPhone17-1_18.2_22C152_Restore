@interface EMFReader
- (EMFReader)initWithEMFPlayer:(id)a3;
- (int)play:(id)a3;
@end

@implementation EMFReader

- (EMFReader)initWithEMFPlayer:(id)a3
{
  return self;
}

- (int)play:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];
  if (v6)
  {
    char v7 = 0;
    unint64_t v8 = v5 + v6;
    while (v5 + 8 <= v8)
    {
      unsigned int v9 = *(_DWORD *)(v5 + 4);
      if (v9 < 8) {
        break;
      }
      unint64_t v10 = v5 + v9;
      if (v10 > v8) {
        break;
      }
      int v11 = -[EMFPlayer play:in_pRecord:](self->m_player, "play:in_pRecord:");
      if (v11 == -7) {
        int v12 = 0;
      }
      else {
        int v12 = v11;
      }
      v7 |= v11 == -7;
      BOOL v13 = v12 == 0;
      if (v12) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v10 == v8;
      }
      uint64_t v5 = v10;
      if (v14) {
        goto LABEL_17;
      }
    }
    BOOL v13 = 0;
    int v12 = -7;
  }
  else
  {
    int v12 = 0;
    char v7 = 0;
    BOOL v13 = 1;
  }
LABEL_17:
  [(EMFPlayer *)self->m_player done];
  if (v7) {
    int v15 = -7;
  }
  else {
    int v15 = 0;
  }
  if (v13) {
    int v16 = v15;
  }
  else {
    int v16 = v12;
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end