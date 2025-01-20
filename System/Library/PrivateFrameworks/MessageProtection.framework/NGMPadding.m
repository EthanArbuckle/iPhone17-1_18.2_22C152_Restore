@interface NGMPadding
+ (id)padMessage:(id)a3 error:(id *)a4;
+ (id)unpadMessage:(id)a3 error:(id *)a4;
@end

@implementation NGMPadding

+ (id)padMessage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  CFTypeRef cf = 0;
  if (v5)
  {
    int64_t v7 = SecMPComputePaddingForTransport([v5 length], 2, (CFErrorRef *)&cf);
    if (cf)
    {
      v8 = (void *)CFCopyDescription(cf);
      CFRelease(cf);
      v9 = [NSString stringWithFormat:@"Error obtaining the padding length: %@", v8];
      MPLogAndAssignError(401, a4, v9);
    }
    else
    {
      if (v7 < 0x100000000)
      {
        int v19 = v7;
        v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", v7 + objc_msgSend(v6, "length") + 4);
        uint64_t v13 = [v6 length];
        id v14 = v6;
        objc_msgSend(v12, "replaceBytesInRange:withBytes:", 0, v13, objc_msgSend(v14, "bytes"));
        v15 = (const __SecRandom *)*MEMORY[0x263F17510];
        id v16 = v12;
        uint64_t v17 = SecRandomCopyBytes(v15, v7, (void *)([v16 mutableBytes] + objc_msgSend(v14, "length")));
        if (v17)
        {
          v18 = objc_msgSend(NSString, "stringWithFormat:", @"An issue occured while generating random bytes for padding with error: %i", v17);
          MPLogAndAssignError(4, a4, v18);

          id v10 = 0;
        }
        else
        {
          objc_msgSend(v16, "replaceBytesInRange:withBytes:", objc_msgSend(v14, "length") + v7, 4, &v19);
          id v10 = v16;
        }

        goto LABEL_9;
      }
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"The padding configuration suggested is larger than what can be represented in the payload: %li", v7);
      MPLogAndAssignError(401, a4, v8);
    }
  }
  else
  {
    MPLogAndAssignError(401, a4, @"Cannot pad a nil message.");
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

+ (id)unpadMessage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    MPLogAndAssignError(401, a4, @"Cannot unpad a nil message.");
LABEL_8:
    id v10 = 0;
    goto LABEL_9;
  }
  if ((unint64_t)[v5 length] <= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"The message is too short (%lu) to contain any padding.", objc_msgSend(v6, "length"), v14);
    v9 = LABEL_7:;
    MPLogAndAssignError(401, a4, v9);

    goto LABEL_8;
  }
  unsigned int v15 = 0;
  objc_msgSend(v6, "getBytes:range:", &v15, objc_msgSend(v6, "length") - 4, 4);
  unint64_t v7 = v15 + 4;
  if (v7 > [v6 length])
  {
    v8 = NSString;
    uint64_t v13 = [v6 length];
    objc_msgSend(v8, "stringWithFormat:", @"The message is too short (%lu) to contain the indicated padding(%u).", v13, v15);
    goto LABEL_7;
  }
  uint64_t v12 = [v6 length];
  id v10 = objc_msgSend(v6, "subdataWithRange:", 0, v12 - v15 - 4);
LABEL_9:

  return v10;
}

@end