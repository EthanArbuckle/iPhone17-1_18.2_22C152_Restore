@interface Section
- (Section)initWithUUID:(id)a3 kind:(int)a4 depth:(int)a5 parent:(id)a6;
- (id)description;
- (id)sectionRoot;
- (void)_dumpPrefix:(const char *)a3 depth:(int)a4 to:(id)a5;
- (void)dumpEndSectionTo:(id)a3;
- (void)dumpPrefixWithKind:(int)a3 depth:(int)a4 to:(id)a5;
@end

@implementation Section

- (Section)initWithUUID:(id)a3 kind:(int)a4 depth:(int)a5 parent:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)Section;
  v11 = [(Section *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_parent, a6);
    v12->_kind = a4;
    v12->_depth = a5;
    if (a4 == 4 || !v10)
    {
      uint64_t v14 = ((_BYTE)dword_10002A8F8 + 1) & 7;
      dword_10002A8F8 = ((_BYTE)dword_10002A8F8 + 1) & 7;
      v12->_color = dword_10001B580[v14];
    }
    else
    {
      v13 = [(Section *)v12 sectionRoot];
      v12->_color = v13[2];
    }
  }

  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%d parent: %@", self->_kind, self->_parent];
}

- (id)sectionRoot
{
  v2 = self;
  parent = v2->_parent;
  if (parent)
  {
    while (v2->_kind != 4)
    {
      v4 = parent;

      parent = v4->_parent;
      v2 = v4;
      if (!parent) {
        goto LABEL_6;
      }
    }
  }
  v4 = v2;
LABEL_6:

  return v4;
}

- (void)_dumpPrefix:(const char *)a3 depth:(int)a4 to:(id)a5
{
  id v8 = a5;
  if (a4 >= 1)
  {
    id v9 = v8;
    if (self->_kind != 4)
    {
      [(Section *)self->_parent _dumpPrefix:a3 depth:(a4 - 1) to:v8];
      id v8 = v9;
    }
    [v8 startFgColor:self->_color attr:2];
    [v9 puts:a3 len:strlen(a3)];
    [v9 reset];
    id v8 = v9;
  }
}

- (void)dumpPrefixWithKind:(int)a3 depth:(int)a4 to:(id)a5
{
  id v8 = a5;
  id v9 = " o ";
  id v10 = "[ ";
  v11 = "┃  ";
  id v12 = v8;
  switch(a3)
  {
    case 0:
      id v9 = "┃  ";
      goto LABEL_4;
    case 2:
      id v9 = "┏  ";
      goto LABEL_4;
    case 4:
      goto LABEL_8;
    case 5:
LABEL_4:
      if (a3 == 5) {
        v11 = v9;
      }
      if (self->_kind != 4)
      {
        id v10 = v9;
LABEL_8:
        [(Section *)self->_parent _dumpPrefix:v11 depth:(a4 - 1) to:v8];
        id v8 = v12;
        id v9 = v10;
      }
      [v8 startFgColor:self->_color attr:2];
      [v12 puts:v9 len:strlen(v9)];
      [v12 reset];

      return;
    default:
      sub_100016BF8();
  }
}

- (void)dumpEndSectionTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_kind != 4)
  {
    [(Section *)self->_parent _dumpPrefix:"┃  " depth:(self->_depth - 1) to:v4];
    id v4 = v5;
  }
  [v4 startFgColor:self->_color attr:2];
  [v5 write:@"%send\n", "┗  "];
  [v5 reset];
}

- (void).cxx_destruct
{
}

@end