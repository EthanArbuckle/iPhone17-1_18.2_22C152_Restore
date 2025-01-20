@interface WFBlockKeyCommand
+ (id)commandWithTitle:(id)a3 input:(id)a4 modifierFlags:(int64_t)a5 block:(id)a6;
- (id)block;
@end

@implementation WFBlockKeyCommand

+ (id)commandWithTitle:(id)a3 input:(id)a4 modifierFlags:(int64_t)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"WFBlockKeyCommand.m", 29, @"Invalid parameter not satisfying: %@", @"input" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"WFBlockKeyCommand.m", 28, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_11:
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, a1, @"WFBlockKeyCommand.m", 30, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_4:
  v14 = [a1 commandWithTitle:v11 image:0 action:sel_wf_handleBlockKeyCommand_ input:v12 modifierFlags:a5 propertyList:0];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    v16 = (void *)v14[34];
    v14[34] = v15;

    v17 = v14;
  }

  return v14;
}

- (void).cxx_destruct
{
}

- (id)block
{
  return self->_block;
}

@end