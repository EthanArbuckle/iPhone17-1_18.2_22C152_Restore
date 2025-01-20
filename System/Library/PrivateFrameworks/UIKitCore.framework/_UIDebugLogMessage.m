@interface _UIDebugLogMessage
+ (id)messageWithFormat:(id)a3;
+ (id)messageWithNewline;
+ (id)messageWithPrefix:(id)a3 color:(id)a4 string:(id)a5;
+ (id)messageWithString:(id)a3;
+ (id)messageWithStyle:(unint64_t)a3 string:(id)a4;
- (BOOL)_isNode;
- (BOOL)_isTransparent;
- (_UIDebugLogMessage)initWithString:(id)a3 attributedString:(id)a4;
- (id)_attributedStringRepresentation;
- (id)_stringRepresentation;
@end

@implementation _UIDebugLogMessage

- (_UIDebugLogMessage)initWithString:(id)a3 attributedString:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIDebugLogTree.m" lineNumber:70 description:@"At least one representation needs to be specified."];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDebugLogMessage;
  v10 = [(_UIDebugLogMessage *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    objc_storeStrong((id *)&v11->_attributedString, a4);
  }

  return v11;
}

+ (id)messageWithNewline
{
  v2 = (void *)[objc_alloc((Class)a1) initWithString:&stru_1ED0E84C0 attributedString:0];
  return v2;
}

+ (id)messageWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"_UIDebugLogTree.m", 86, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  v7 = (void *)[objc_alloc((Class)a1) initWithString:v6 attributedString:0];
  return v7;
}

+ (id)messageWithFormat:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"_UIDebugLogTree.m", 95, @"Invalid parameter not satisfying: %@", @"format" object file lineNumber description];
  }
  v6 = (void *)[[NSString alloc] initWithFormat:v5 arguments:&v11];
  v7 = [a1 messageWithString:v6];

  return v7;
}

+ (id)messageWithPrefix:(id)a3 color:(id)a4 string:(id)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"_UIDebugLogTree.m", 107, @"Invalid parameter not satisfying: %@", @"prefix" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"_UIDebugLogTree.m", 108, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];

LABEL_3:
  v13 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  if ([v13 length])
  {
    objc_super v14 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    if (v10)
    {
      uint64_t v15 = *(void *)off_1E52D2048;
      v30[0] = *(void *)off_1E52D2260;
      v30[1] = v15;
      v31[0] = &unk_1ED3F2278;
      v31[1] = v10;
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = (void **)v31;
      v18 = v30;
      uint64_t v19 = 2;
    }
    else
    {
      uint64_t v28 = *(void *)off_1E52D2260;
      v29 = &unk_1ED3F2278;
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = &v29;
      v18 = &v28;
      uint64_t v19 = 1;
    }
    v21 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
    v22 = [NSString stringWithFormat:@"(%@) ", v13];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v22 attributes:v21];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14];
    [v23 appendAttributedString:v24];

    v20 = (void *)[objc_alloc((Class)a1) initWithString:0 attributedString:v23];
  }
  else
  {
    v20 = [a1 messageWithString:v12];
    objc_super v14 = v12;
  }

  return v20;
}

+ (id)messageWithStyle:(unint64_t)a3 string:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v6 = [a4 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  v7 = v6;
  switch(a3)
  {
    case 0uLL:
      id v8 = v6;
      goto LABEL_4;
    case 1uLL:
      id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v28 = *(void *)off_1E52D2260;
      v29[0] = &unk_1ED3F2278;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v9 = (void *)[v10 initWithString:v7 attributes:v11];

      id v8 = 0;
      break;
    case 2uLL:
      id v8 = [NSString stringWithFormat:@"(info) %@", v6];
      id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v26 = *(void *)off_1E52D2048;
      v13 = +[UIColor systemBlueColor];
      v27 = v13;
      objc_super v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = &v27;
      v16 = &v26;
      goto LABEL_8;
    case 3uLL:
      id v8 = [NSString stringWithFormat:@"(warning) %@", v6];
      id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v24 = *(void *)off_1E52D2048;
      v13 = +[UIColor systemYellowColor];
      v25 = v13;
      objc_super v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = &v25;
      v16 = &v24;
LABEL_8:
      uint64_t v17 = 1;
      goto LABEL_10;
    case 4uLL:
      id v8 = [NSString stringWithFormat:@"(error) %@", v6];
      id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v18 = *(void *)off_1E52D2048;
      v22[0] = *(void *)off_1E52D2260;
      v22[1] = v18;
      v23[0] = &unk_1ED3F2278;
      v13 = +[UIColor systemRedColor];
      v23[1] = v13;
      objc_super v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = (void **)v23;
      v16 = v22;
      uint64_t v17 = 2;
LABEL_10:
      uint64_t v19 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      id v9 = (void *)[v12 initWithString:v7 attributes:v19];

      break;
    default:
      id v8 = 0;
LABEL_4:
      id v9 = 0;
      break;
  }
  v20 = (void *)[objc_alloc((Class)a1) initWithString:v8 attributedString:v9];

  return v20;
}

- (BOOL)_isNode
{
  return 0;
}

- (BOOL)_isTransparent
{
  return 0;
}

- (id)_stringRepresentation
{
  string = self->_string;
  if (string)
  {
    v3 = string;
  }
  else
  {
    v3 = [(NSAttributedString *)self->_attributedString string];
  }
  return v3;
}

- (id)_attributedStringRepresentation
{
  attributedString = self->_attributedString;
  if (attributedString) {
    v3 = attributedString;
  }
  else {
    v3 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_string];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end