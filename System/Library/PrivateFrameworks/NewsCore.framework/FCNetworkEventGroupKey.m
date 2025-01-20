@interface FCNetworkEventGroupKey
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation FCNetworkEventGroupKey

- (unint64_t)hash
{
  if (self)
  {
    uint64_t eventType = self->_eventType;
    unint64_t sessionID = self->_sessionID;
    self = (FCNetworkEventGroupKey *)self->_respondingPOP;
    unint64_t v4 = sessionID ^ eventType;
  }
  else
  {
    unint64_t v4 = 0;
  }
  return [(FCNetworkEventGroupKey *)self hash] ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (uint64_t *)a3;
  v5 = v4;
  if (self)
  {
    int eventType = self->_eventType;
    if (v4)
    {
LABEL_3:
      int v7 = *((_DWORD *)v4 + 2);
      goto LABEL_4;
    }
  }
  else
  {
    int eventType = 0;
    if (v4) {
      goto LABEL_3;
    }
  }
  int v7 = 0;
LABEL_4:
  if (eventType != v7)
  {
LABEL_13:
    char v14 = 0;
    goto LABEL_14;
  }
  if (self)
  {
    unint64_t sessionID = self->_sessionID;
    if (v4)
    {
LABEL_7:
      uint64_t v9 = v4[2];
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t sessionID = 0;
    if (v4) {
      goto LABEL_7;
    }
  }
  uint64_t v9 = 0;
LABEL_8:
  if (sessionID != v9) {
    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x1E4FBA8A8];
  if (!self)
  {
    respondingPOP = 0;
    if (v4) {
      goto LABEL_11;
    }
LABEL_20:
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  respondingPOP = self->_respondingPOP;
  if (!v4) {
    goto LABEL_20;
  }
LABEL_11:
  uint64_t v12 = v4[3];
LABEL_12:
  v13 = respondingPOP;
  char v14 = objc_msgSend(v10, "nf_object:isEqualToObject:", v13, v12);

LABEL_14:
  return v14;
}

- (void).cxx_destruct
{
}

@end