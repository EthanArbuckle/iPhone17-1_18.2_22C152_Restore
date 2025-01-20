@interface eTBtehykeBvfpeTP
+ (id)hKjCyPlJs74k9vMV:(int64_t)a3;
+ (id)rsNB9HkZVEH0l6fT:(char *)a3 gsx0MJUoOpcxcozG:(unsigned int)a4;
- (Gpvs7B00ytMM3bTs)evaluatorManager;
- (NSMutableArray)Uh5ScKFVtUOjeURk;
- (NSMutableArray)i4KDOQicW9Xd5WBz;
- (NSMutableArray)qnmnskUkG0QuvlrL;
- (eTBtehykeBvfpeTP)initWithdEyUJuqYjUufZYGN:(id)a3 CYjHC6NGGdOD33W9:(_XqnwpLSFrBke2fSP *)a4 g8citQiyynNCr9c4:(_nc5BBnMiYo0TSmWP *)a5;
- (id)PLMCCRRqEw4moT9R:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6;
- (id)listDependenciesForDataframe:(_KUwyEjpVZR65eUyl *)a3;
- (id)yVPDC4E5nNW5DSMa:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6;
- (unint64_t)jCbmcix0xxhNVOSS:(_KUwyEjpVZR65eUyl *)a3 TWWnmIjkBlMfHmma:(id)a4;
- (unsigned)hi5ump20ke7n4x6o:(_KUwyEjpVZR65eUyl *)a3;
- (unsigned)pDYAPbGDBo6ZMVXG:(id)a3;
- (void)KKbGrSwDukIWFRjI:(_JqTz0JeuAWNFxnUl *)a3 i4KDOQicW9Xd5WBz:(id)a4 TWWnmIjkBlMfHmma:(id)a5;
- (void)setEvaluatorManager:(id)a3;
- (void)setI4KDOQicW9Xd5WBz:(id)a3;
- (void)setQnmnskUkG0QuvlrL:(id)a3;
- (void)setUh5ScKFVtUOjeURk:(id)a3;
@end

@implementation eTBtehykeBvfpeTP

+ (id)hKjCyPlJs74k9vMV:(int64_t)a3
{
  v4 = [kjAS9HuCdR1m5txL alloc];
  if (a3) {
    int64_t v5 = a3;
  }
  else {
    int64_t v5 = 150;
  }
  v6 = [(kjAS9HuCdR1m5txL *)v4 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v5];

  return v6;
}

+ (id)rsNB9HkZVEH0l6fT:(char *)a3 gsx0MJUoOpcxcozG:(unsigned int)a4
{
  v6 = malloc_type_malloc(a4 + 1, 0x95BFE890uLL);
  if (v6)
  {
    v7 = v6;
    memcpy(v6, a3, a4);
    v7[a4] = 0;
    v8 = +[NSString stringWithUTF8String:v7];
    free(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (eTBtehykeBvfpeTP)initWithdEyUJuqYjUufZYGN:(id)a3 CYjHC6NGGdOD33W9:(_XqnwpLSFrBke2fSP *)a4 g8citQiyynNCr9c4:(_nc5BBnMiYo0TSmWP *)a5
{
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)eTBtehykeBvfpeTP;
  v9 = [(eTBtehykeBvfpeTP *)&v28 init];
  if (v9)
  {
    uint64_t var2 = a5->var2;
    uint64_t var0 = a5->var0;
    v29[0] = @"cg";
    v12 = +[NSNumber numberWithUnsignedChar:a4->var2];
    v30[0] = v12;
    v29[1] = @"bc";
    v13 = +[NSNumber numberWithUnsignedInt:a4->var1];
    v30[1] = v13;
    v29[2] = @"kv";
    v14 = +[NSNumber numberWithUnsignedInt:a4->var0];
    v30[2] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

    v16 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:var2];
    Uh5ScKFVtUOjeURk = v9->_Uh5ScKFVtUOjeURk;
    v9->_Uh5ScKFVtUOjeURk = v16;

    v18 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:var2];
    qnmnskUkG0QuvlrL = v9->_qnmnskUkG0QuvlrL;
    v9->_qnmnskUkG0QuvlrL = v18;

    v20 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:var0];
    i4KDOQicW9Xd5WBz = v9->_i4KDOQicW9Xd5WBz;
    v9->_i4KDOQicW9Xd5WBz = v20;

    if (var2)
    {
      for (uint64_t i = 0; i != var2; ++i)
      {
        [(NSMutableArray *)v9->_Uh5ScKFVtUOjeURk setObject:&off_1006880E8 atIndexedSubscript:i];
        [(NSMutableArray *)v9->_qnmnskUkG0QuvlrL setObject:&off_100688100 atIndexedSubscript:i];
      }
    }
    if (var0)
    {
      for (uint64_t j = 0; j != var0; ++j)
      {
        v24 = +[kjAS9HuCdR1m5txL cR9LfsxC1Nz4IZKu];
        [(NSMutableArray *)v9->_i4KDOQicW9Xd5WBz setObject:v24 atIndexedSubscript:j];
      }
    }
    v25 = [[Gpvs7B00ytMM3bTs alloc] initWithdEyUJuqYjUufZYGN:v8 Po0NnEfbQHpSgzj7:v15 jHoy3L8RogTTbjjB:a5->var5 X5iUjoUzZPsj1b68:a5->var4];
    evaluatorManager = v9->_evaluatorManager;
    v9->_evaluatorManager = v25;
  }
  return v9;
}

- (id)yVPDC4E5nNW5DSMa:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  v11 = [[YNHF5E1zsUQomY0e alloc] initWithtaDFBApmLBObrNlM:a3 itCyNcNHxjurvzrS:self];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10000AC6C;
  v19 = sub_10000AC7C;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000AC84;
  v14[3] = &unk_10065ED70;
  v14[4] = &v15;
  [(YNHF5E1zsUQomY0e *)v11 nQ82YhFf5OQDL4Qk:v14 UtPlzRffoEpw7Ue1:a4 SFkZRA5Ek9YzhDRs:v6 TWWnmIjkBlMfHmma:v10];
  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)PLMCCRRqEw4moT9R:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  if ([(eTBtehykeBvfpeTP *)self hi5ump20ke7n4x6o:a3])
  {
    v11 = [(Gpvs7B00ytMM3bTs *)self->_evaluatorManager rk4Hn364TkSyMq2q:a3->var0 version:a3->var1];
    id v12 = +[NSArray arrayWithArray:self->_i4KDOQicW9Xd5WBz];
    v13 = [v11 compute:a3 UtPlzRffoEpw7Ue1:a4 SFkZRA5Ek9YzhDRs:v6 jAVr67FQ6j4EzsgV:self i4KDOQicW9Xd5WBz:v12 TWWnmIjkBlMfHmma:v10];

    unint64_t v14 = [(eTBtehykeBvfpeTP *)self jCbmcix0xxhNVOSS:a3 TWWnmIjkBlMfHmma:v10];
    [v13 setJmiV9VW8P3Gxz1H7:v14];
    id v15 = v13;
  }
  else
  {
    v16 = +[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:151];
    unint64_t v17 = [(eTBtehykeBvfpeTP *)self jCbmcix0xxhNVOSS:a3 TWWnmIjkBlMfHmma:v10];

    [v16 setJmiV9VW8P3Gxz1H7:v17];
    id v15 = v16;
  }

  return v15;
}

- (id)listDependenciesForDataframe:(_KUwyEjpVZR65eUyl *)a3
{
  int64_t v5 = [(Gpvs7B00ytMM3bTs *)self->_evaluatorManager rk4Hn364TkSyMq2q:a3->var0 version:a3->var1];
  uint64_t v6 = [v5 listDependencies:a3 jAVr67FQ6j4EzsgV:self];

  return v6;
}

- (void)KKbGrSwDukIWFRjI:(_JqTz0JeuAWNFxnUl *)a3 i4KDOQicW9Xd5WBz:(id)a4 TWWnmIjkBlMfHmma:(id)a5
{
  uint64_t v9 = 0;
  v7 = +[Yp00msaYdVlZesvU eJSthhES04gLkDjz:&a3->var1 i4KDOQicW9Xd5WBz:a4 TWWnmIjkBlMfHmma:a5 eZh1LWn1FH2uQtPX:&v9];
  id v8 = +[NSNumber numberWithInteger:v9];
  [(NSMutableArray *)self->_qnmnskUkG0QuvlrL setObject:v8 atIndexedSubscript:a3->var0];

  if (v7) {
    [(NSMutableArray *)self->_Uh5ScKFVtUOjeURk setObject:v7 atIndexedSubscript:a3->var0];
  }
}

- (unsigned)pDYAPbGDBo6ZMVXG:(id)a3
{
  id v3 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [&off_100688580 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v27;
LABEL_3:
    id v8 = 0;
    uint64_t v9 = v6;
    while (1)
    {
      if (*(void *)v27 != v7) {
        objc_enumerationMutation(&off_100688580);
      }
      id v10 = +[NSString stringWithFormat:@"%@\\s*%@\\s*%@", *(void *)(*((void *)&v26 + 1) + 8 * (void)v8), @"[!=|~<>]+", @"[A-Z0-9a-z\\._%+-]+"];
      id v25 = v9;
      v11 = +[NSRegularExpression regularExpressionWithPattern:v10 options:1 error:&v25];
      id v6 = v25;

      if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v3, 8, 0, objc_msgSend(v3, "length"))) {
        break;
      }

      id v8 = (char *)v8 + 1;
      uint64_t v9 = v6;
      if (v5 == v8)
      {
        id v5 = [&off_100688580 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
    id v6 = 0;
LABEL_11:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [&off_100688598 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (!v12)
    {
      unsigned __int8 v18 = 1;
      goto LABEL_21;
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
LABEL_13:
    id v15 = 0;
    v16 = v6;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(&off_100688598);
      }
      unint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\\s*%@\\s*%@", *(void *)(*((void *)&v21 + 1) + 8 * (void)v15), @"[!=|~<>]+", @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}");
      id v20 = v16;
      v11 = +[NSRegularExpression regularExpressionWithPattern:v17 options:1 error:&v20];
      id v6 = v20;

      if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v3, 8, 0, objc_msgSend(v3, "length"))) {
        break;
      }

      id v15 = (char *)v15 + 1;
      v16 = v6;
      if (v13 == v15)
      {
        id v13 = [&off_100688598 countByEnumeratingWithState:&v21 objects:v30 count:16];
        unsigned __int8 v18 = 1;
        if (v13) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }
    }
  }

  unsigned __int8 v18 = 0;
LABEL_21:

  return v18;
}

- (unsigned)hi5ump20ke7n4x6o:(_KUwyEjpVZR65eUyl *)a3
{
  if (a3->var0 - 1 > 1) {
    return 1;
  }
  id v4 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:a3->var4.var0.var0 gsx0MJUoOpcxcozG:a3->var4.var1.var0.var1];
  LOBYTE(self) = [(eTBtehykeBvfpeTP *)self pDYAPbGDBo6ZMVXG:v4];

  return self;
}

- (unint64_t)jCbmcix0xxhNVOSS:(_KUwyEjpVZR65eUyl *)a3 TWWnmIjkBlMfHmma:(id)a4
{
  evaluatorManager = self->_evaluatorManager;
  uint64_t var0 = a3->var0;
  uint64_t var1 = a3->var1;
  id v9 = a4;
  id v10 = [(Gpvs7B00ytMM3bTs *)evaluatorManager rk4Hn364TkSyMq2q:var0 version:var1];
  v11 = +[NSArray arrayWithArray:self->_i4KDOQicW9Xd5WBz];
  id v12 = [v10 computeHash:a3 jAVr67FQ6j4EzsgV:self i4KDOQicW9Xd5WBz:v11 TWWnmIjkBlMfHmma:v9];

  return (unint64_t)v12;
}

- (NSMutableArray)i4KDOQicW9Xd5WBz
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setI4KDOQicW9Xd5WBz:(id)a3
{
}

- (NSMutableArray)Uh5ScKFVtUOjeURk
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUh5ScKFVtUOjeURk:(id)a3
{
}

- (NSMutableArray)qnmnskUkG0QuvlrL
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQnmnskUkG0QuvlrL:(id)a3
{
}

- (Gpvs7B00ytMM3bTs)evaluatorManager
{
  return (Gpvs7B00ytMM3bTs *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEvaluatorManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluatorManager, 0);
  objc_storeStrong((id *)&self->_qnmnskUkG0QuvlrL, 0);
  objc_storeStrong((id *)&self->_Uh5ScKFVtUOjeURk, 0);

  objc_storeStrong((id *)&self->_i4KDOQicW9Xd5WBz, 0);
}

@end