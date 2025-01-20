@interface SAProximateProcess
@end

@implementation SAProximateProcess

uint64_t __35__SAProximateProcess_displayString__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = a2;
  v5 = a3;
  v7 = v5;
  if (v4)
  {
    unsigned int v8 = v4[2];
    if (v5)
    {
LABEL_3:
      unsigned int v9 = v5[2];
      goto LABEL_4;
    }
  }
  else
  {
    unsigned int v8 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  unsigned int v9 = 0;
LABEL_4:
  if (v8 < v9)
  {
    uint64_t v10 = 1;
    goto LABEL_16;
  }
  if (v4)
  {
    unsigned int v11 = v4[2];
    if (v5)
    {
LABEL_8:
      unsigned int v12 = v5[2];
      goto LABEL_9;
    }
  }
  else
  {
    unsigned int v11 = 0;
    if (v5) {
      goto LABEL_8;
    }
  }
  unsigned int v12 = 0;
LABEL_9:
  if (v11 <= v12)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v15 = Property;
    if (v7) {
      id v16 = objc_getProperty(v7, v14, 16, 1);
    }
    else {
      id v16 = 0;
    }
    uint64_t v10 = [v15 compare:v16];
  }
  else
  {
    uint64_t v10 = -1;
  }
LABEL_16:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originProcesses, 0);
  objc_storeStrong((id *)&self->_pids, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end