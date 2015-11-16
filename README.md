# BINPopView

![image](https://raw.githubusercontent.com/BINDeveloper/BINPopView/master/PopView.gif)


一款类似新浪微博的popView，点击按钮后在你需要的位置弹出你想要的菜单、或者其他视图，最大的优点是，高度灵活，背景图片，contentView全部可以自定义。Demo中的三张图片如果需要使用，也要将图片添加到你的项目中。
How To Use 

UITableView * tabelView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    tabelView.tag = arrowPosition;
    tabelView.delegate = self;
    tabelView.dataSource = self;
    BINPopView * popView = [BINPopView menuWithContentView:tabelView];
    popView.delegate = self;
    popView.arrowPosition = arrowPosition;
[popView showInRect:CGRectMake((BINScreenW/2.0)-(menuW/2.0),self.topLayoutGuide.length, menuW, menuH)];

创建初始化时传入一个contentView；
专心写好contentView，接下来你只需在需要展示的任意位置、以及popView大小指定，使用 -(void)showInRect：rect; 即可完成展示
点击视图外的任意位置都将dismiss，dismiss是会调用代理方法，你可以做你想做的操作，没错就是这么简单！
希望大家喜欢。新手菜鸟一枚，望大神多多指教，日后会花时间将它日益壮大，实现更加强大的功能，让使用更简单，
=最后向各位致敬！谢谢大家愿意看小弟写的东西。


