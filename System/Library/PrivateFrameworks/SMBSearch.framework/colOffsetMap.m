@interface colOffsetMap
- (NSArray)lengthOffsets;
- (NSArray)statusOffsets;
- (NSArray)valueOffsets;
- (colOffsetMap)initWithCtx:(id)a3;
- (void)setLengthOffsets:(id)a3;
- (void)setStatusOffsets:(id)a3;
- (void)setValueOffsets:(id)a3;
@end

@implementation colOffsetMap

- (colOffsetMap)initWithCtx:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)colOffsetMap;
  v5 = [(colOffsetMap *)&v17 init];
  if (v5)
  {
    if ([v4 serverSupports64BitOffsets])
    {
      objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E958988, &unk_26E9589A0, &unk_26E9589B8, &unk_26E9589D0, &unk_26E9589E8, &unk_26E958A00, &unk_26E958A18, &unk_26E958A30, &unk_26E958A48, &unk_26E958A60, &unk_26E958A78, &unk_26E958A90, &unk_26E958AA8, &unk_26E958AC0, &unk_26E958AD8, &unk_26E958AF0, &unk_26E958B08,
        &unk_26E958B20,
        &unk_26E958B38,
        &unk_26E958B50,
        &unk_26E958B68,
        &unk_26E958B80,
        &unk_26E958B98,
        &unk_26E958BB0,
      uint64_t v6 = 0);
      statusOffsets = v5->_statusOffsets;
      v5->_statusOffsets = (NSArray *)v6;

      if (!v5->_statusOffsets) {
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E958BC8, &unk_26E958BE0, &unk_26E958BF8, &unk_26E958C10, &unk_26E958C28, &unk_26E958C40, &unk_26E958C58, &unk_26E958C70, &unk_26E958C88, &unk_26E958CA0, &unk_26E958CB8, &unk_26E958CD0, &unk_26E958CE8, &unk_26E958D00, &unk_26E958D18, &unk_26E958D30, &unk_26E958D48,
        &unk_26E958D60,
        &unk_26E958D78,
        &unk_26E958D90,
        &unk_26E958DA8,
        &unk_26E958DC0,
        &unk_26E958DD8,
        &unk_26E958DF0,
      uint64_t v8 = 0);
      lengthOffsets = v5->_lengthOffsets;
      v5->_lengthOffsets = (NSArray *)v8;

      if (!v5->_lengthOffsets) {
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E958E08, &unk_26E958E20, &unk_26E958E38, &unk_26E958E50, &unk_26E958E68, &unk_26E958E80, &unk_26E958E98, &unk_26E958EB0, &unk_26E958EC8, &unk_26E958EE0, &unk_26E958EF8, &unk_26E958F10, &unk_26E958F28, &unk_26E958F40, &unk_26E958F58, &unk_26E958F70, &unk_26E958F88,
        &unk_26E958FA0,
        &unk_26E958FB8,
        &unk_26E958FD0,
        &unk_26E958FE8,
        &unk_26E959000,
        &unk_26E959018,
        &unk_26E959030,
        0);
    }
    else
    {
      objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E958988, &unk_26E9589A0, &unk_26E959048, &unk_26E959060, &unk_26E959078, &unk_26E959090, &unk_26E958C28, &unk_26E9590A8, &unk_26E9590C0, &unk_26E9590D8, &unk_26E9590F0, &unk_26E959108, &unk_26E959120, &unk_26E959138, &unk_26E959150, &unk_26E959168, &unk_26E959180,
        &unk_26E959198,
        &unk_26E958D00,
        &unk_26E9591B0,
        &unk_26E9591C8,
        &unk_26E9591E0,
        &unk_26E9591F8,
        &unk_26E959210,
      uint64_t v10 = 0);
      v11 = v5->_statusOffsets;
      v5->_statusOffsets = (NSArray *)v10;

      if (!v5->_statusOffsets) {
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E958BC8, &unk_26E959228, &unk_26E958E38, &unk_26E959240, &unk_26E959258, &unk_26E959270, &unk_26E958C40, &unk_26E959288, &unk_26E9592A0, &unk_26E958EB0, &unk_26E958C70, &unk_26E958C88, &unk_26E9592B8, &unk_26E9592D0, &unk_26E9592E8, &unk_26E959300, &unk_26E959318,
        &unk_26E958CE8,
        &unk_26E959330,
        &unk_26E959348,
        &unk_26E958AD8,
        &unk_26E959360,
        &unk_26E959378,
        &unk_26E959390,
      uint64_t v12 = 0);
      v13 = v5->_lengthOffsets;
      v5->_lengthOffsets = (NSArray *)v12;

      if (!v5->_lengthOffsets) {
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E958E08, &unk_26E9593A8, &unk_26E9593C0, &unk_26E9593D8, &unk_26E958BF8, &unk_26E9593F0, &unk_26E959408, &unk_26E958E80, &unk_26E958E98, &unk_26E959420, &unk_26E959438, &unk_26E958EC8, &unk_26E959450, &unk_26E959468, &unk_26E958EF8, &unk_26E958CB8, &unk_26E959480,
        &unk_26E959498,
        &unk_26E958F40,
        &unk_26E958F58,
        &unk_26E9594B0,
        &unk_26E9594C8,
        &unk_26E958D30,
        &unk_26E9594E0,
        0);
    uint64_t v14 = };
    valueOffsets = v5->_valueOffsets;
    v5->_valueOffsets = (NSArray *)v14;

    if (!v5->_valueOffsets)
    {
LABEL_10:

      v5 = 0;
    }
  }

  return v5;
}

- (NSArray)statusOffsets
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStatusOffsets:(id)a3
{
}

- (NSArray)lengthOffsets
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLengthOffsets:(id)a3
{
}

- (NSArray)valueOffsets
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValueOffsets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueOffsets, 0);
  objc_storeStrong((id *)&self->_lengthOffsets, 0);

  objc_storeStrong((id *)&self->_statusOffsets, 0);
}

@end