@interface PETProtobufRawDecodedMessage
- (BOOL)readFrom:(id)a3;
- (PETProtobufRawDecodedMessage)initWithData:(id)a3;
- (PETProtobufRawDecodedMessage)initWithData:(id)a3 nestedFields:(id)a4;
- (id)dictionaryRepresentation;
@end

@implementation PETProtobufRawDecodedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedFields, 0);

  objc_storeStrong((id *)&self->_decodedDict, 0);
}

- (id)dictionaryRepresentation
{
  v2 = (void *)[(NSMutableDictionary *)self->_decodedDict copy];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  v4 = a3;
  v5 = (int *)MEMORY[0x1E4F940E8];
  v6 = (int *)MEMORY[0x1E4F940E0];
  v7 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_58:
    BOOL v68 = v4[*v7] == 0;
  }
  else
  {
    unint64_t v8 = 0x1E4F28000uLL;
    v70 = self;
LABEL_3:
    if (v4[*v7]) {
      goto LABEL_58;
    }
    uint64_t v9 = MEMORY[0x192FD4890]();
    v11 = (void *)v9;
    char v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = 0;
    v15 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      uint64_t v16 = *v5;
      uint64_t v17 = *(void *)&v4[v16];
      unint64_t v18 = v17 + 1;
      if (v17 == -1 || v18 > *(void *)&v4[*v6]) {
        break;
      }
      char v19 = *(unsigned char *)(*(void *)&v4[*v15] + v17);
      *(void *)&v4[v16] = v18;
      v14 |= (unint64_t)(v19 & 0x7F) << v12;
      if ((v19 & 0x80) == 0) {
        goto LABEL_13;
      }
      v12 += 7;
      BOOL v20 = v13++ >= 9;
      if (v20)
      {
        unint64_t v14 = 0;
        uint64_t v21 = *v7;
        if (v4[v21]) {
          goto LABEL_61;
        }
LABEL_14:
        v22 = 0;
        unint64_t v23 = v14 >> 3;
        v72 = (void *)v9;
        switch(v14 & 7)
        {
          case 0uLL:
            char v24 = 0;
            unsigned int v25 = 0;
            uint64_t v26 = 0;
            v27 = *(void **)(v8 + 3792);
            while (1)
            {
              uint64_t v28 = *v5;
              uint64_t v29 = *(void *)&v4[v28];
              unint64_t v30 = v29 + 1;
              if (v29 == -1 || v30 > *(void *)&v4[*v6]) {
                break;
              }
              char v31 = *(unsigned char *)(*(void *)&v4[*v15] + v29);
              *(void *)&v4[v28] = v30;
              v26 |= (unint64_t)(v31 & 0x7F) << v24;
              if ((v31 & 0x80) == 0) {
                goto LABEL_32;
              }
              v24 += 7;
              BOOL v20 = v25++ >= 9;
              if (v20)
              {
                uint64_t v32 = 0;
                goto LABEL_35;
              }
            }
            v4[*v7] = 1;
LABEL_32:
            if (v4[*v7]) {
              uint64_t v32 = 0;
            }
            else {
              uint64_t v32 = v26;
            }
LABEL_35:
            uint64_t v49 = [v27 numberWithLongLong:v32];
            goto LABEL_42;
          case 1uLL:
            v33 = *(void **)(v8 + 3792);
            uint64_t v34 = *v5;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v6])
            {
              double v36 = *(double *)(*(void *)&v4[*v15] + v35);
              *(void *)&v4[v34] = v35 + 8;
            }
            else
            {
              v4[v21] = 1;
              double v36 = 0.0;
            }
            uint64_t v49 = [v33 numberWithDouble:v36];
            goto LABEL_42;
          case 2uLL:
            v71 = PBReaderReadData();
            nestedFields = self->_nestedFields;
            v38 = [*(id *)(v8 + 3792) numberWithUnsignedInt:v23];
            v39 = [(NSDictionary *)nestedFields objectForKeyedSubscript:v38];

            if (v39)
            {
              v40 = [PETProtobufRawDecodedMessage alloc];
              v41 = self->_nestedFields;
              v42 = [*(id *)(v8 + 3792) numberWithUnsignedInt:v23];
              v43 = [(NSDictionary *)v41 objectForKeyedSubscript:v42];
              v44 = [(PETProtobufRawDecodedMessage *)v40 initWithData:v71 nestedFields:v43];

              if (v44)
              {
                v22 = [(PETProtobufRawDecodedMessage *)v44 dictionaryRepresentation];
                self = v70;
                v45 = v71;
              }
              else
              {
                v45 = v71;
                v22 = [v71 base64EncodedStringWithOptions:0];
                self = v70;
              }
              v7 = (int *)MEMORY[0x1E4F940C8];
            }
            else
            {
              v45 = v71;
              v50 = (void *)[[NSString alloc] initWithData:v71 encoding:4];
              if (v50)
              {
                v44 = v50;
                v22 = v44;
                unint64_t v8 = 0x1E4F28000;
              }
              else
              {
                v66 = [[PETProtobufRawDecodedMessage alloc] initWithData:v71];
                v67 = v66;
                if (v66) {
                  [(PETProtobufRawDecodedMessage *)v66 dictionaryRepresentation];
                }
                else {
                v22 = [v71 base64EncodedStringWithOptions:0];
                }
                unint64_t v8 = 0x1E4F28000;

                v44 = 0;
              }
            }

            goto LABEL_46;
          case 5uLL:
            v46 = *(void **)(v8 + 3792);
            uint64_t v47 = *v5;
            unint64_t v48 = *(void *)&v4[v47];
            if (v48 <= 0xFFFFFFFFFFFFFFFBLL && v48 + 4 <= *(void *)&v4[*v6])
            {
              LODWORD(v10) = *(_DWORD *)(*(void *)&v4[*v15] + v48);
              *(void *)&v4[v47] = v48 + 4;
            }
            else
            {
              v4[v21] = 1;
              double v10 = 0.0;
            }
            uint64_t v49 = [v46 numberWithFloat:v10];
LABEL_42:
            v22 = (void *)v49;
LABEL_46:
            if (v4[*v7])
            {
              v11 = v72;
LABEL_60:

              goto LABEL_61;
            }
            decodedDict = self->_decodedDict;
            v52 = [*(id *)(v8 + 3792) numberWithUnsignedInt:v23];
            v53 = [(NSMutableDictionary *)decodedDict objectForKeyedSubscript:v52];

            v54 = self->_decodedDict;
            v55 = [*(id *)(v8 + 3792) numberWithUnsignedInt:v23];
            if (v53)
            {
              v56 = [(NSMutableDictionary *)v54 objectForKeyedSubscript:v55];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                v58 = self->_decodedDict;
                v59 = [NSNumber numberWithUnsignedInt:v23];
                v60 = [(NSMutableDictionary *)v58 objectForKeyedSubscript:v59];

                v61 = [MEMORY[0x1E4F1CA48] arrayWithObject:v60];
                v62 = self->_decodedDict;
                v63 = [NSNumber numberWithUnsignedInt:v23];
                [(NSMutableDictionary *)v62 setObject:v61 forKeyedSubscript:v63];

                self = v70;
              }
              v64 = self->_decodedDict;
              unint64_t v8 = 0x1E4F28000uLL;
              v55 = [NSNumber numberWithUnsignedInt:v23];
              v65 = [(NSMutableDictionary *)v64 objectForKeyedSubscript:v55];
              [v65 addObject:v22];

              v7 = (int *)MEMORY[0x1E4F940C8];
            }
            else
            {
              [(NSMutableDictionary *)v54 setObject:v22 forKeyedSubscript:v55];
              v7 = (int *)MEMORY[0x1E4F940C8];
              unint64_t v8 = 0x1E4F28000;
            }
            v5 = (int *)MEMORY[0x1E4F940E8];

            if (*(void *)&v4[*v5] >= *(void *)&v4[*v6]) {
              goto LABEL_58;
            }
            break;
          default:
            goto LABEL_60;
        }
        goto LABEL_3;
      }
    }
    v4[*v7] = 1;
LABEL_13:
    uint64_t v21 = *v7;
    if (!v4[v21]) {
      goto LABEL_14;
    }
LABEL_61:
    BOOL v68 = 0;
  }

  return v68;
}

- (PETProtobufRawDecodedMessage)initWithData:(id)a3 nestedFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PETProtobufRawDecodedMessage;
  unint64_t v8 = [(PETProtobufRawDecodedMessage *)&v15 init];
  if (!v8) {
    goto LABEL_4;
  }
  uint64_t v9 = objc_opt_new();
  decodedDict = v8->_decodedDict;
  v8->_decodedDict = (NSMutableDictionary *)v9;

  objc_storeStrong((id *)&v8->_nestedFields, a4);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v6];
  if (![(PETProtobufRawDecodedMessage *)v8 readFrom:v11])
  {

    goto LABEL_6;
  }
  char v12 = [v11 hasError];

  if (v12)
  {
LABEL_6:
    unsigned int v13 = 0;
    goto LABEL_7;
  }
LABEL_4:
  unsigned int v13 = v8;
LABEL_7:

  return v13;
}

- (PETProtobufRawDecodedMessage)initWithData:(id)a3
{
  return [(PETProtobufRawDecodedMessage *)self initWithData:a3 nestedFields:0];
}

@end