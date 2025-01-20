@interface NoteObject(ICLegacyNoteUI)
- (BOOL)appendAttributedString:()ICLegacyNoteUI error:;
@end

@implementation NoteObject(ICLegacyNoteUI)

- (BOOL)appendAttributedString:()ICLegacyNoteUI error:
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 managedObjectContext];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = &stru_1F0973378;
  if ([v4 length])
  {
    uint64_t v6 = *MEMORY[0x1E4FB0708];
    uint64_t v7 = *MEMORY[0x1E4FB06E8];
    v33[0] = *MEMORY[0x1E4FB06D8];
    v33[1] = v7;
    v34[0] = v6;
    v34[1] = &unk_1F09A3EF0;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    v9 = objc_msgSend(v4, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v4, "length"), v8, 0);
    uint64_t v10 = [[NSString alloc] initWithData:v9 encoding:4];
    v11 = (void *)v22[5];
    v22[5] = v10;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__NoteObject_ICLegacyNoteUI__appendAttributedString_error___block_invoke;
  v16[3] = &unk_1E5FD9988;
  v16[4] = a1;
  v19 = &v21;
  id v12 = v4;
  id v17 = v12;
  id v13 = v5;
  id v18 = v13;
  v20 = &v27;
  [v13 performBlockAndWait:v16];
  BOOL v14 = v28[5] == 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

@end