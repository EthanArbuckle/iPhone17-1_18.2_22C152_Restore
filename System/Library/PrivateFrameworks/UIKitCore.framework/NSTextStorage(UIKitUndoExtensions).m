@interface NSTextStorage(UIKitUndoExtensions)
- (id)_UIUndoRedoAttributedSubstringFromRange:()UIKitUndoExtensions;
- (uint64_t)_UIUndoRedoTextOperation:()UIKitUndoExtensions;
@end

@implementation NSTextStorage(UIKitUndoExtensions)

- (uint64_t)_UIUndoRedoTextOperation:()UIKitUndoExtensions
{
  return [a3 undoRedo];
}

- (id)_UIUndoRedoAttributedSubstringFromRange:()UIKitUndoExtensions
{
  v7 = [a1 string];
  unint64_t v8 = a3 + a4;
  unint64_t v9 = [v7 length];
  if (a3 + a4 >= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = a3 + a4;
  }
  if (v8 <= v9) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = v9 - a3;
  }
  if (v11 == v9)
  {
    v12 = (void *)[a1 copyWithZone:0];
  }
  else
  {
    if (v8 <= v9) {
      unint64_t v13 = a4;
    }
    else {
      unint64_t v13 = v9 - a3;
    }
    uint64_t v14 = objc_msgSend(v7, "substringWithRange:", a3, v13);

    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
    if (a3 < v10)
    {
      unint64_t v15 = a3;
      do
      {
        uint64_t v20 = 0;
        unint64_t v21 = 0;
        v16 = [a1 attributesAtIndex:v15 effectiveRange:&v20];
        if (v21 + v20 <= v10) {
          unint64_t v17 = v20 - v15 + v21;
        }
        else {
          unint64_t v17 = v10 - v15;
        }
        if (v20 != v15 || v21 + v20 > v10) {
          unint64_t v21 = v17;
        }
        objc_msgSend(v12, "addAttributes:range:", v16, v15 - a3, v17);
        v15 += v21;
      }
      while (v15 < v10);
    }
    v7 = (void *)v14;
  }

  return v12;
}

@end