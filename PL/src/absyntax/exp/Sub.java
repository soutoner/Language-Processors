package absyntax.exp;

import absyntax.Generator;

public class Sub extends Exp {

    public final Exp exp_1, exp_2;

    public Sub(Exp e1, Exp e2){ exp_1 = e1; exp_2 = e2; }

    @Override
    public Object eval() {
        String tmp = Generator.getInstance().newTmp();

        Generator.getInstance().out().println("    " + tmp + " = " + exp_1.eval() + " - " + exp_2.eval());

        return tmp;
    }
}
